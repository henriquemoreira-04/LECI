import heapq
import math

# Constantes baseadas em consts.py e game.py
WIDTH = 48
HEIGHT = 24
DIRECTION_NORTH = 0
DIRECTION_EAST = 1
DIRECTION_SOUTH = 2
DIRECTION_WEST = 3

class Ia:
    def __init__(self, agent_name):
        self.name = agent_name
        self.width = WIDTH
        self.height = HEIGHT
        # Cache para simulação se necessário, mas o estado muda a cada frame

    def action(self, state):
        if "bug_blaster" not in state or "centipedes" not in state:
            return ""

        blaster = state["bug_blaster"]
        blaster_pos = tuple(blaster["pos"])
        
        if not blaster.get("alive", True):
            return ""

        centipedes = state["centipedes"]
        # Criar set de cogumelos para acesso rápido O(1)
        mushrooms = {tuple(m["pos"]) for m in state.get("mushrooms", [])}

        # 1. ANALISAR O ESTADO DAS CENTOPEIAS
        total_segments = 0
        all_bodies = []
        for c in centipedes:
            total_segments += len(c["body"])
            all_bodies.extend(c["body"])

        # CONSTRAINT: Deixar uma cabeça viva.
        # Se houver apenas 1 segmento (uma cabeça) no total, NÃO DISPARAR.
        leave_alive_mode = (total_segments == 1)

        # 2. CONSTRUIR GRELHA DE PERIGO (Safety Map)
        # Penalizamos posições onde as centopeias estão ou VÃO estar.
        danger_grid = self._build_danger_grid(centipedes, mushrooms)
        
        # Verificar perigo imediato na posição atual
        current_danger = danger_grid[blaster_pos[0]][blaster_pos[1]]

        # 3. TOMADA DE DECISÃO
        move_command = ""

        # Prioridade A: SOBREVIVÊNCIA (Se estiver em perigo ou muito perto)
        if current_danger > 0:
            target_pos = self._find_safest_spot(blaster_pos, danger_grid)
            move_command = self._get_move_to_target(blaster_pos, target_pos, danger_grid, mushrooms)
            
            # Se tivermos que fugir e pudermos disparar para nos defendermos (exceto se for para deixar vivo)
            # Nota: Às vezes é preciso disparar para sobreviver mesmo no modo leave_alive, 
            # mas vamos ser estritos com o pedido "deixar uma viva".
            if not leave_alive_mode and self._has_target_in_line(blaster_pos, centipedes):
                return move_command + " A" # Tenta mover e disparar se possível (client lida com prioridade)
            return move_command

        # Prioridade B: MODO "DEIXAR VIVA" (Apenas desviar, nunca disparar)
        if leave_alive_mode:
            # Se não estamos em perigo imediato, tentamos centralizar ou ficar numa zona segura
            # Mas _find_safest_spot já nos dá o melhor spot (menor custo).
            # Podemos tentar ir para o centro se for seguro, para ter mais manobra.
            target_pos = self._find_safest_spot(blaster_pos, danger_grid)
            return self._get_move_to_target(blaster_pos, target_pos, danger_grid, mushrooms)

        # Prioridade C: ATAQUE PREDITIVO
        # Calcular a melhor posição de tiro baseada na previsão do movimento
        target_x = self._predict_best_shot_x(blaster_pos, centipedes, mushrooms)
        
        if target_x is not None:
            # Se já estamos na posição de tiro
            if blaster_pos[0] == target_x:
                return "A" # Disparar
            else:
                # Mover para a posição de tiro
                target_pos = (target_x, blaster_pos[1])
                # Verificar se o caminho para o tiro é seguro
                move_to_shot = self._get_move_to_target(blaster_pos, target_pos, danger_grid, mushrooms)
                return move_to_shot
        
        # Se não há alvo claro ou seguro, mover para local seguro por defeito
        target_pos = self._find_safest_spot(blaster_pos, danger_grid)
        return self._get_move_to_target(blaster_pos, target_pos, danger_grid, mushrooms)

    # --- SIMULAÇÃO E PREVISÃO ---

    def _predict_best_shot_x(self, blaster_pos, centipedes, mushrooms):
        """
        Encontra a melhor coluna X para disparar, prevendo onde a centopeia estará
        quando a bala lá chegar.
        """
        best_x = None
        min_time_to_kill = float('inf')
        
        # Velocidade da bala (estimativa: assumimos que é rápida, ~1-2 tiles/frame, 
        # mas o jogo é por turnos. Vamos assumir que demora (Altura - Y) frames)
        # Velocidade da centopeia = 1 tile por frame (aprox).
        
        for centipede in centipedes:
            if not centipede.get("body"):
                continue
                
            # Simular o movimento desta centopeia por N frames
            # O alvo é a cabeça ou o corpo. Vamos apontar para a cabeça.
            head = centipede["body"][-1] # No game.py head é o último
            direction = centipede["direction"]
            
            # Simular trajetória
            predicted_path = self._simulate_centipede_path(head, direction, mushrooms, steps=20)
            
            for t, (px, py) in enumerate(predicted_path):
                # Tempo para a bala chegar lá: Distância Y
                # Assumindo que a bala viaja instantaneamente ou muito rápido na vertical para simplificar,
                # ou que demora (height - 1 - blaster_y) + (height - 1 - py) ...
                # Vamos simplificar: queremos estar no X onde a centopeia passa.
                
                # Tempo para o agente chegar ao X de disparo
                dist_x = abs(px - blaster_pos[0])
                time_to_move = dist_x
                
                # Se conseguirmos chegar ao X antes da centopeia chegar lá (com alguma margem)
                if time_to_move <= t:
                    # Escolhemos o tiro mais rápido (menor t)
                    # Damos prioridade a centopeias mais baixas (maior Y)
                    score = t - py * 2 # Heurística: matar as que estão mais fundo primeiro
                    
                    if score < min_time_to_kill:
                        min_time_to_kill = score
                        best_x = px
                        
        return best_x

    def _simulate_centipede_path(self, head_pos, direction, mushrooms, steps=15):
        """
        Simula a lógica de movimento da centopeia do game.py para prever posições futuras.
        """
        path = []
        cx, cy = head_pos
        curr_dir = direction
        move_dir = 1 # 1 = down, -1 = up (assumindo descida inicial)
        
        # Precisamos de saber se a centopeia está a subir ou descer. 
        # O estado não dá 'move_dir' diretamente, mas podemos inferir ou assumir descida (padrão).
        # Para ser mais robusto, assumimos descida exceto se bater no fundo.
        
        for _ in range(steps):
            # Lógica baseada em Centipede.move() do game.py
            # Calcular próxima posição teórica
            nx, ny = cx, cy
            
            if curr_dir == DIRECTION_EAST:
                nx += 1
            elif curr_dir == DIRECTION_WEST:
                nx -= 1
            # Norte/Sul são usados apenas nas trocas verticais
            
            # Verificar colisão com paredes ou cogumelos
            collision = False
            if nx < 0 or nx >= self.width:
                collision = True
            elif (nx, ny) in mushrooms:
                collision = True
                
            if not collision:
                # Movimento livre lateral
                cx, cy = nx, ny
            else:
                # Colisão: Mover verticalmente e inverter
                if cy >= self.height - 1:
                    move_dir = -1 # Bateu no fundo, começa a subir
                elif cy == 0:
                    move_dir = 1 # Bateu no topo, começa a descer
                
                ny = cy + move_dir
                
                # Se o movimento vertical bater num cogumelo (raro mas possível)
                if (cx, ny) in mushrooms:
                    ny = cy # Não move verticalmente, apenas inverte horizontal?
                    # O jogo original é complexo aqui, mas vamos simplificar:
                
                cy = ny
                # Inverter direção
                curr_dir = DIRECTION_WEST if curr_dir == DIRECTION_EAST else DIRECTION_EAST
            
            path.append((cx, cy))
            
        return path

    # --- SEGURANÇA (Safety Grid) ---

    def _build_danger_grid(self, centipedes, mushrooms):
        grid = [[0 for _ in range(self.height)] for _ in range(self.width)]
        
        # Marcar cogumelos como bloqueios (opcional, mas bom para pathfinding)
        # Vamos dar um custo pequeno para desencorajar ficar debaixo de cogumelos (tiros bloqueados)
        for mx, my in mushrooms:
            if 0 <= mx < self.width and 0 <= my < self.height:
                grid[mx][my] += 50 

        # Marcar centopeias e áreas adjacentes
        for centipede in centipedes:
            body = centipede["body"]
            if not body: continue
            
            # Prever onde a cabeça vai estar nos próximos passos para evitar colisões
            head = body[-1]
            direction = centipede["direction"]
            predicted = self._simulate_centipede_path(head, direction, mushrooms, steps=5)
            
            # O corpo atual é perigo mortal
            for bx, by in body:
                if 0 <= bx < self.width and 0 <= by < self.height:
                    grid[bx][by] = 999 # MORTE

            # A zona futura imediata é perigo
            for px, py in predicted:
                 if 0 <= px < self.width and 0 <= py < self.height:
                    grid[px][py] += 500 # Perigo iminente

            # Criar uma "aura" de perigo à volta da cabeça para evitar tangentes
            hx, hy = head
            for dx in [-1, 0, 1]:
                for dy in [-1, 0, 1]:
                    nx, ny = hx + dx, hy + dy
                    if 0 <= nx < self.width and 0 <= ny < self.height:
                        grid[nx][ny] += 100

        return grid

    # --- PATHFINDING (Dijkstra) ---

    def _find_safest_spot(self, start_pos, grid):
        """
        Encontra a posição acessível com o menor valor na danger_grid.
        Usa Dijkstra para garantir que é alcançável.
        """
        pq = [(grid[start_pos[0]][start_pos[1]], start_pos)]
        visited = set()
        min_danger = float('inf')
        safest_pos = start_pos
        
        # Limitar a procura para performance e porque só nos movemos na zona do blaster
        # O blaster só se move nas linhas de baixo (geralmente y > height - 6 ou similar no jogo original,
        # mas aqui o blaster tem movimento limitado?) 
        # No game.py: BugBlaster.move tem limites?
        # Sim, o mapa define limites, mas o agente deve saber. 
        # Vamos assumir que o agente pode ir a qualquer lado que não tenha cogumelos/paredes.
        
        while pq:
            cost, current = heapq.heappop(pq)
            
            if current in visited:
                continue
            visited.add(current)
            
            # Se encontrarmos um spot seguro (0 perigo), é ótimo, mas continuamos a procurar melhor ou mais perto
            if grid[current[0]][current[1]] < min_danger:
                min_danger = grid[current[0]][current[1]]
                safest_pos = current
            
            # Limite de exploração (opcional)
            if len(visited) > 200: 
                break

            cx, cy = current
            # Vizinhos (N, S, E, W)
            neighbors = [
                (cx+1, cy), (cx-1, cy), (cx, cy+1), (cx, cy-1)
            ]
            
            for nx, ny in neighbors:
                if 0 <= nx < self.width and 0 <= ny < self.height:
                    if (nx, ny) not in visited:
                        # O custo do path é acumulativo do perigo?
                        # Não, queremos o destino mais seguro, mas o caminho tem de ser seguro.
                        # Custo = max(danger no caminho) ou soma? Vamos usar soma para evitar caminhos perigosos.
                        new_cost = cost + grid[nx][ny] + 1 # +1 para distância
                        if new_cost < 1000: # Não passar por zonas mortais
                             heapq.heappush(pq, (new_cost, (nx, ny)))
                             
        return safest_pos

    def _get_move_to_target(self, current, target, grid, mushrooms):
        """
        Calcula o próximo passo para ir de current para target usando A* simples.
        """
        if current == target:
            return ""
            
        pq = [(0, current)]
        came_from = {current: None}
        cost_so_far = {current: 0}
        
        while pq:
            _, curr = heapq.heappop(pq)
            
            if curr == target:
                break
                
            cx, cy = curr
            for dx, dy, move_char in [(0, -1, "w"), (0, 1, "s"), (-1, 0, "a"), (1, 0, "d")]:
                nx, ny = cx + dx, cy + dy
                
                if 0 <= nx < self.width and 0 <= ny < self.height:
                    # Penalidade pesada para cogumelos e perigo
                    tile_danger = grid[nx][ny]
                    if (nx, ny) in mushrooms:
                        tile_danger += 999 # Não bater em cogumelos
                        
                    new_cost = cost_so_far[curr] + 1 + tile_danger
                    
                    if (nx, ny) not in cost_so_far or new_cost < cost_so_far[(nx, ny)]:
                        cost_so_far[(nx, ny)] = new_cost
                        priority = new_cost + self._heuristic((nx, ny), target)
                        heapq.heappush(pq, (priority, (nx, ny)))
                        came_from[(nx, ny)] = (curr, move_char)
                        
        # Reconstruir caminho
        if target not in came_from:
            return "" # Não há caminho
            
        curr = target
        path = []
        while curr != current:
            parent, move = came_from[curr]
            path.append(move)
            curr = parent
            
        return path[-1] if path else ""

    def _heuristic(self, a, b):
        return abs(a[0] - b[0]) + abs(a[1] - b[1])

    def _has_target_in_line(self, blaster_pos, centipedes):
        bx, by = blaster_pos
        for c in centipedes:
            for seg in c["body"]:
                if seg[0] == bx and seg[1] < by:
                    return True
        return False
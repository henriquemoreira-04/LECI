class MDP:

    def __init__(self, world, gama, epsilon):
        self.world = world
        self.gama = gama
        self.epsilon = epsilon

    
    def value_iteration(self):
        # 1. Inicializar utilidades a 0 para todos los estados
        states = self.world.states()
        U = {s: 0.0 for s in states}
        
        while True:
            U_new = U.copy()
            delta = 0
            
            # Para cada estado 's' en el mundo
            for s in states:
                # Calculamos la utilidad esperada máxima sobre todas las acciones posibles
                # Formula: R(s) + gamma * max( sum( P(s'|s,a) * U(s') ) )
                
                max_expected_utility = -float('inf')
                
                actions = self.world.actions()
                # Calcular sum( P(s'|s,a) * U(s') ) para cada accion 'a'
                expected_utilities = []
                
                for a in actions:
                    sum_prob_util = 0.0
                    # Obtenemos los posibles estados siguientes y sus probabilidades
                    # GridWorld.generate_effects devuelve {next_state: prob, ...}
                    effects = self.world.generate_effects(s, a)
                    
                    for next_s, prob in effects.items():
                        if next_s in U: # Verificar que el estado existe en nuestro mapa de utilidades
                            sum_prob_util += prob * U[next_s]
                            
                    expected_utilities.append(sum_prob_util)
                
                if expected_utilities:
                    max_expected_utility = max(expected_utilities)
                else:
                    max_expected_utility = 0.0

                # Actualizar U_new[s]
                U_new[s] = self.world.reward(s) + self.gama * max_expected_utility
                
                # Actualizar delta (diferencia máxima) para verificar convergencia
                if abs(U_new[s] - U[s]) > delta:
                    delta = abs(U_new[s] - U[s])
            
            U = U_new
            
            limit = self.epsilon * (1 - self.gama) / self.gama
            if delta < limit:
                return U

    def policy(self, U):
        """Dadas las utilidades U, devuelve la mejor acción para cada estado"""
        policy_map = {}
        states = self.world.states()
        
        for s in states:
            best_action = None
            max_val = -float('inf')
            
            # Buscar qué acción maximiza la utilidad esperada
            for a in self.world.actions():
                sum_val = 0.0
                effects = self.world.generate_effects(s, a)
                for next_s, prob in effects.items():
                    if next_s in U:
                        sum_val += prob * U[next_s]
                
                if sum_val > max_val:
                    max_val = sum_val
                    best_action = a
            
            policy_map[s] = best_action
            
        return policy_map
#encoding: utf8
# Name : Henrique Moreira Malaver 
# NMEC : 119809

from semanticnetwork import *
from constraintsearch import *
from bayes_net import *
from collections import Counter # forma contar sin bucles innecesario 


class MySN(SemanticNetwork):
    def __init__(self):
        SemanticNetwork.__init__(self)
        # ADD CODE HERE IF NEEDED
    
    def new_query_local(self,e1,relname=None,e2=None):
        # IMPLEMENT HERE
        #exe 1
        resultados = set() # Usamos un set para evitar resultados duplicados
        for d in self.declarations: # recorremos declaraciones 
            if d.relation.entity1 == e1: # verificamos si la entidad e1 es origen de la relacion 
                if relname is not None and d.relation.name != relname: # # Si el nombre no coincide, pasamos a la siguiente declaración
                    continue
                if e2 is not None and d.relation.entity2 != e2: # Si el destino no coincide pasamos a la siguiente 
                    continue
                
                resultados.add((d.relation.name, d.relation.entity2)) #colocamos en tupla 

            if d.relation.entity2 == e1: # verificamos si la entidad e1 es destino de la relacion
                nombre_inverso = self.inverse.get(d.relation.name) # obtenemos inverso
                
                if nombre_inverso: # solo seguimos si la imversa es real 
                    
                    if relname is not None and nombre_inverso != relname: # si el nombre no coincide saltamos
                        continue
                    
                    if e2 is not None and d.relation.entity1 != e2: #usando logica inversa el destino lógico es la entity 1 original
                        continue
                    
                    resultados.add((nombre_inverso, d.relation.entity1))# Añadimos el resultado usando el nombre inverso y la entidad origen como destino

        return list(resultados) # convertimos el conjunto a lista antes de devolverlo

    def new_query(self,entity,relname):
        # IMPLEMENT HERE
        # exe 2 
        conteo = Counter()   #contador para las apariciones de cada tipo de asociación
        for d in self.declarations: # Recorremos todas las declaraciones
            if d.relation.name == relname: # Filtramos por el nombre de relación
                if isinstance(d.relation, AssocOne): # Si es AssocOne, incrementamos su conteo
                    conteo['AssocOne'] += 1 # Incrementa el conteo de AssocOne
                elif isinstance(d.relation, AssocSome): # Si es AssocSome, incrementamos su conteo
                    conteo['AssocSome'] += 1 
        
        if not conteo: # Si no hay declaraciones para esa relación, devolvemos lista vacía
            return [] 
            
        tipo_asociacion = conteo.most_common(1)[0][0] # Obtenemos el tipo de asociación más común
        clase_esperada = AssocOne if tipo_asociacion == 'AssocOne' else AssocSome # # Definimos la clase exacta que vamos a aceptar
        
        #bfs 
        ancestros = [entity] # Lista de ancestros a explorar
        visitados = {entity} # Conjunto de entidades ya visitadas
        i = 0
        while i < len(ancestros): # Mientras haya ancestros por explorar
            actual = ancestros[i] # Obtenemos el ancestro actual
            rels = self.new_query_local(actual) # navegamos la estructura
            for r, destino in rels: # Recorremos las relaciones obtenidas
                if r in ['member', 'subtype'] and destino not in visitados: # Evitamos ciclos
                    visitados.add(destino) # Marcamos el destino como visitado
                    ancestros.append(destino) # Añadimos el destino a la lista de ancestros por explorar
            i += 1
        rel_opuesta = self.opposite.get(relname)
        valores_finales = set()
        valores_bloqueados = set()
        
        for anc in ancestros:
            vals_locales_raw = [] # Valores locales sin filtrar aún
            
            for d in self.declarations: # Recorremos todas las declaraciones
                if not isinstance(d.relation, clase_esperada): 
                    continue

                # Directa
                if d.relation.entity1 == anc and d.relation.name == relname: # Filtramos por nombre de relación
                    vals_locales_raw.append(d.relation.entity2)  # Añadimos el destino a los valores locales
                
                # Inversa
                if d.relation.entity2 == anc: # Verificamos si anc es el destino
                    inv = self.inverse.get(d.relation.name) # Obtenemos el nombre inverso
                    if inv == relname: # Comparamos con el nombre de relación buscado
                        vals_locales_raw.append(d.relation.entity1) # Añadimos el origen a los valores locales

            vals_opuestos = [] # Valores de la relación opuesta
            if rel_opuesta: # Si existe una relación opuesta definida
                vals_opuestos = [val for r, val in self.new_query_local(anc, rel_opuesta) if r == rel_opuesta] # Obtenemos los valores opuestos
            
            if tipo_asociacion == 'AssocOne': # Si el tipo ganador es AssocOne
                if vals_opuestos: # Si hay valores en la relación opuesta bloqueamos todo
                    return []  # Devolver lista vacía inmediatamente
                if vals_locales_raw: # Si hay valores locales
                    return [Counter(vals_locales_raw).most_common(1)[0][0]] # Devolver el valor más común
                    
            elif tipo_asociacion == 'AssocSome': # Si el tipo ganador es AssocSome
                for v in vals_locales_raw: # Añadimos valores locales si no están bloqueados
                    if v not in valores_bloqueados: # Si no está bloqueado
                        valores_finales.add(v) # Añadimos el valor a los finales
                for v in vals_opuestos: # Bloqueamos valores de la relación opuesta
                    valores_bloqueados.add(v) # Añadimos el valor a los bloqueados

        return list(valores_finales) # Devolver la lista de valores finales


class MyCS(ConstraintSearch):

    def __init__(self,domains,constraints):
        ConstraintSearch.__init__(self,domains,constraints)
        # ADD CODE HERE IF NEEDED
        pass

    def search_all(self,domains=None):
        # IMPLEMENT HERE
        #exe 3
        self.calls += 1 #contaod para rendimiento 
        
        if domains is None: 
            domains = self.domains #si no pasan dominios se usa el original

        if any([len(lv) == 0 for lv in domains.values()]): # si este camino falla revuelvo vacio
            return []

        if all([len(lv) == 1 for lv in list(domains.values())]): 
            return [{v: lv[0] for (v, lv) in domains.items()}] # si las variables concuerdan devuelvo la solucion
       
        vars_disponibles = [v for v in domains if len(domains[v]) > 1] # selecciono las variables disponibles , con más de un valor posible
        
        if not vars_disponibles:  # retorno vacio si no hay variables disponibles
            return []
            
        # ahora ordenamos la lista con varios criterios 
        
        vars_disponibles.sort(key=lambda v: (len(domains[v]), v)) # sorteamos por tamaño de y nombre
        
        variable_elegida = vars_disponibles[0]  # Me quedo con la ganadora la primera de la lista ordenada
        
        soluciones = [] # Backtracking para encontrar las soluciones posibles 
        
        for val in domains[variable_elegida]: # Pruebo uno por uno los valores posibles de la variable elegida
            nuevos_dominios = dict(domains) # se hace una copia de los dominios para no dañar los de esta iteración
            nuevos_dominios[variable_elegida] = [val] #asignamos valor
            
            self.propagate(nuevos_dominios, variable_elegida) #Propago restricciones para reducir los dominios de los vecinos
            
            sols_rama = self.search_all(nuevos_dominios) # Llamada recursiva para buscar soluciones en la rama actual
            
            if sols_rama: 
                soluciones.extend(sols_rama) #si hay soluciones en rama las agrego a la lista principal
                
        return soluciones #retorno las soluciones encontradas

class MyBN(BayesNet):

    def __init__(self):
        BayesNet.__init__(self)
        # ADD CODE HERE IF NEEDED
        pass

    def independence_bag(self,v1,v2):
        # IMPLEMENT HERE
        #exe 4
         
        #Construimos el grafo para poder subir.
        padres = {} # Diccionario de padres
        for v in self.dependencies.keys(): # Recorremos todas las variables con dependencias
            padres[v] = set() # Inicializamos el conjunto de padres para cada variable
            for conj_madres in self.dependencies[v].keys(): # Recorremos las combinaciones de madres
                for (m_var, m_val) in conj_madres: # Recorremos cada madre en la combinación
                    padres[v].add(m_var) # Añadimos la madre al conjunto de padres de la variable

        # fucion auxiliar para obtener ancestros
        def get_ancestors(var):
            ancs = set() # Conjunto de ancestros
            stack = [var] # uso el stack para explorar ancestros
            visitados = set() # Conjunto de visitados para evitar ciclos
            while stack: # Mientras haya nodos por explorar
                curr = stack.pop(0) # Comportamiento tipo cola bfs o pila
                if curr in visitados:# Si ya fue visitado
                    continue # lo saltamos
                visitados.add(curr) # Marcamos como visitado
                ancs.add(curr) # Añadimos a los ancestros
                if curr in padres: # Si tiene padres
                    stack.extend(padres[curr]) # los añadimos a la pila para explorar
            return ancs #  Devolvemos el conjunto de ancestros

        #Obtengo los ancestros de v1 y v2.
        anc_v1 = get_ancestors(v1)
        anc_v2 = get_ancestors(v2)
        
        # Buscamos ancestros comunes
        comunes = anc_v1.intersection(anc_v2)
        
        # Calculamos los LCA 
        lca = set() # Conjunto de LCAs
        for c in comunes: # Recorremos los comunes
            es_lca = True # Suponemos que 'c' es LCA
            for otro in comunes: # Recorremos de nuevo para comparar
                if c != otro and c in get_ancestors(otro): # Si 'c' es ancestro de 'otro',
                    es_lca = False # no es LCA
                    break # Salimos del bucle interno
            if es_lca: # Si sigue siendo LCA
                lca.add(c) # lo añadimos al conjunto de LCAs

        #Construcción del camino
        bag = {v1, v2} # Conjunto inicial de la 'bag'
        
        todos_ancestros = anc_v1.union(anc_v2) # Unión de todos los ancestros
        
        for nodo in todos_ancestros: # Recorremos todos los ancestros
            ancestros_del_nodo = get_ancestors(nodo) # Obtenemos los ancestros del nodo
            

            if not lca.isdisjoint(ancestros_del_nodo): # Si hay intersección
                bag.add(nodo) # Añadimos el nodo a la 'bag'

        #  se añade las madres de todas las variables recolectadas
        vars_finales = list(bag) # Variables finales en el camino
        for v in vars_finales: # Recorremos las variables en el camino
            if v in padres: # Si tiene padres
                bag.update(padres[v]) # los añadimos al camino
            
        return sorted(list(bag)) # Devolvemos la 'bag' (camino) como lista ordenada
    



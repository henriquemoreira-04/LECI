import itertools

class BayesNet:

    def __init__(self, ldep=None):
        if not ldep:
            ldep = {}
        self.dependencies = ldep

    # The network data is stored in a dictionary that
    # associates the dependencies to each variable:
    #    { v1:deps1, v2:deps2, ... }
    # These dependencies are themselves given
    # by another dictionary that associates conditional
    # probabilities to conjunctions of mother variables:
    #    { mothers1:cp1, mothers2:cp2, ... }
    # The conjunctions are frozensets of pairs (mothervar,boolvalue)
    #
    def add(self,var,mothers,prob):
        self.dependencies.setdefault(var,{})[frozenset(mothers)] = prob

    # Joint probability for a given conjunction of
    # all variables of the network
    def jointProb(self,conjunction):
        prob = 1.0
        for (var,val) in conjunction:
            for (mothers,p) in self.dependencies[var].items():
                if mothers.issubset(conjunction):
                    prob*=(p if val else 1-p)
        return prob

   
    def ancestors(self, var):
        """Devuelve un set con todas las variables ascendientes de var"""
        ancestors_set = set()
        
        # Obtenemos las dependencias directas de la variable (sus madres)
        # self.dependencies[var] es un dict. Las claves son frozensets de madres.
        # Necesitamos iterar para extraer los nombres de las variables madre.
        direct_mothers = set()
        if var in self.dependencies:
            for mothers_frozenset in self.dependencies[var]:
                for (mother_name, _) in mothers_frozenset:
                    direct_mothers.add(mother_name)
        
        # Agregamos las madres directas y buscamos sus ancestros recursivamente
        for mother in direct_mothers:
            ancestors_set.add(mother)
            ancestors_set.update(self.ancestors(mother))
            
        return list(ancestors_set) # Se devuelve como lista según pide la guía

    def individualProb(self, var, val):
        """Calcula la probabilidad marginal P(var=val) sumando sobre el resto"""
        
        all_vars = list(self.dependencies.keys())
        
       
        other_vars = [v for v in all_vars if v != var]
        
        total_prob = 0.0
        
       
        for p in itertools.product([True, False], repeat=len(other_vars)):
            # Crear la conjunción: [(var, val), ('A', True), ('B', False)...]
            conjunction = [(var, val)]
            for i, other_val in enumerate(p):
                conjunction.append((other_vars[i], other_val))
            
            # 4. Sumar la probabilidad conjunta de esta combinación
            total_prob += self.jointProb(conjunction)
            
        return total_prob
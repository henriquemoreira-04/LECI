#STUDENT NAME: HENRIQUE MOREIRA MALAVER 
#STUDENT NUMBER: 119809

#DISCUSSED TPI-1 WITH: (names and numbers):


from tree_search import *
from strips import *
from blocksworld2 import *

class MyNode(SearchNode):

    def __init__(self,state,parent,depth=0,cost=0,heuristic=0):
        super().__init__(state,parent)
        #ADD HERE ANY CODE YOU NEED
        self.depth = depth
        self.cost = cost
        self.heuristic = heuristic
        self.eval = cost + heuristic
        self.children = []


class MyTree(SearchTree):

    def __init__(self,problem, strategy='breadth'):
        super().__init__(problem,strategy)
        #ADD HERE ANY CODE YOU NEED
        
        h0 = 0 # tomar el primer elemento para comenzar 
        
        try:
            h0 = self.problem.domain.heuristic(problem.initial,problem.goal)
        
        except:
            h0 = 0 # en caso de fallo sera 0
        
        root = MyNode(problem.initial, None, 0, 0, h0)
        self.open_nodes = [root]
        self.terminal = 0
        self.non_terminal = 0
        self.solution = None
        self.solution_cost = None

    def hybrid_add_to_open(self,lnewnodes):
        #IMPLEMENT HERE
        self.open_nodes.extend(lnewnodes)

        root_h = 0

        if self.open_nodes:
           root_h = self.open_nodes[0].heuristic
        
        limit = root_h * 0.5

        found_maior = False
        for node in self.open_nodes:
            if node.cost > limit:
                found_maior = True
                
                break
        
        if found_maior:
            self.open_nodes.sort(key=lambda x: x.heuristic)
        else:
            self.open_nodes.sort(key=lambda x: x.cost)


    def search2(self,avoid = False):  # evitar los repetidos 
        # IMPLEMENT HERE
            self.terminal = 0
            self.non_terminal = 0
            while self.open_nodes:   # comenzamos con aquellos que ya tengo 
                node = self.open_nodes.pop(0)

                if self.problem.goal_test(node.state):
                    self.solution = node 
                    self.solution_cost = node.cost
                    self.terminal = len(self.open_nodes) + 1
                    return self.get_path(node)
                
                self.non_terminal = self.non_terminal + 1
                new_nodes_list= []

                for action in self.problem.domain.actions(node.state):
                    new_state = self.problem.domain.result(node.state,action)

                    if new_state not in self.get_path(node):
                        new_cost = node.cost + self.problem.domain.cost(node.state,action)

                        new_heuristic = 0
                        try:
                            new_heuristic = self.problem.domain.heuristic(new_state, self.problem.goal)

                        except:
                            new_heuristic = 0
                        
                        new_node = MyNode(new_state,node,node.depth + 1, new_cost, new_heuristic)
                        node.children.append(new_node)

                        if avoid:
                            already_exits= False
                            for existing_node in self.open_nodes:
                                if existing_node.state == new_state:
                                    already_exits = True

                                    if existing_node.cost > new_node.cost:
                                        existing_node.cost = new_node.cost
                                        existing_node.parent = new_node.parent
                                        existing_node.depth = new_node.depth
                                    
                                    break
                            
                            if not already_exits:
                                new_nodes_list.append(new_node)
                        else:
                            new_nodes_list.append(new_node)
                            
                self.add_to_open(new_nodes_list)
            
            self.terminal = len(self.open_nodes)
            return None
    


    def _combine_paths(self, fwd_node, bwd_node, forward_open, backward_open, junction_forward=False):
        forward_path = self.get_path(fwd_node)
        backward_path = self.get_path(bwd_node)
        
        combined = forward_path + backward_path[::-1][1:]
        
        total_cost = fwd_node.cost + bwd_node.cost
        
        final_state = combined[-1]
        sol = MyNode(final_state, None, cost=total_cost, heuristic=0)
        sol.depth = len(combined) - 1

        self.solution = sol
        self.solution_cost = total_cost

        return combined 

    def _combine_paths_reverse(self, fwd_node, bwd_node, forward_open, backward_open):
        return self._combine_paths(fwd_node, bwd_node, forward_open, backward_open)

    def bipolar_search(self):
        self.non_terminal = 0
        self.terminal = 0

        initial_h = 0
        try:
            initial_h = self.problem.domain.heuristic(self.problem.initial, self.problem.goal)
        except:
            initial_h = 0

        forward_open = [MyNode(self.problem.initial, None, cost=0, heuristic=initial_h)]
        forward_closed = {}

        reverse_prob = SearchProblem(self.problem.domain, self.problem.goal, self.problem.initial)
        
        reverse_h = 0
        try:
            reverse_h = reverse_prob.domain.heuristic(reverse_prob.initial, self.problem.initial)
        except:
            reverse_h = 0

        backward_open = [MyNode(reverse_prob.initial, None, cost=0, heuristic=reverse_h)]
        backward_closed = {}

        while forward_open and backward_open:
            fw_node = forward_open.pop(0)
            forward_closed[fw_node.state] = fw_node

            if fw_node.state in backward_closed:
                return self._combine_paths(fw_node, backward_closed[fw_node.state], forward_open, backward_open)

            fw_path = self.get_path(fw_node)
            fw_successors = []
            for act in self.problem.domain.actions(fw_node.state):
                next_st = self.problem.domain.result(fw_node.state, act)

                if next_st in backward_closed:
                    c = fw_node.cost + self.problem.domain.cost(fw_node.state, act)
                    junction = MyNode(next_st, fw_node, cost=c, heuristic=0)
                    extra = 1 if len(fw_successors) == 0 else 0
                    self.terminal += len(forward_open) + len(fw_successors) + len(backward_open) + extra
                    if len(fw_successors) > 0:
                        self.non_terminal += 2
                    return self._combine_paths(junction, backward_closed[next_st], forward_open, backward_open, True)

                if next_st not in fw_path:
                    c = fw_node.cost + self.problem.domain.cost(fw_node.state, act)
                    h = 0
                    try:
                        h = self.problem.domain.heuristic(next_st, self.problem.goal)
                    except:
                        h = 0
                    fw_successors.append(MyNode(next_st, fw_node, cost=c, heuristic=h))

            if len(fw_successors) > 0:
                self.non_terminal += 1
            else:
                self.terminal += 1

            self.open_nodes = forward_open
            self.add_to_open(fw_successors)
            forward_open = self.open_nodes

            if not backward_open:
                break

            bw_node = backward_open.pop(0)
            backward_closed[bw_node.state] = bw_node

            if bw_node.state in forward_closed:
                return self._combine_paths(forward_closed[bw_node.state], bw_node, forward_open, backward_open)

            bw_path = self.get_path(bw_node)
            bw_successors = []
            for act in reverse_prob.domain.actions(bw_node.state):
                next_st = reverse_prob.domain.result(bw_node.state, act)

                if next_st in forward_closed:
                    c = bw_node.cost + reverse_prob.domain.cost(bw_node.state, act)
                    junction = MyNode(next_st, bw_node, cost=c, heuristic=0)
                    extra = 1 if len(bw_successors) == 0 else 0
                    self.terminal += len(forward_open) + len(backward_open) + len(bw_successors) + extra
                    return self._combine_paths_reverse(forward_closed[next_st], junction, forward_open, backward_open)

                if next_st not in bw_path:
                    c = bw_node.cost + reverse_prob.domain.cost(bw_node.state, act)
                    h = 0
                    try:
                        h = reverse_prob.domain.heuristic(next_st, self.problem.initial)
                    except:
                        h = 0
                    bw_successors.append(MyNode(next_st, bw_node, cost=c, heuristic=h))

            if len(bw_successors) > 0:
                self.non_terminal += 1
            else:
                self.terminal += 1

            self.open_nodes = backward_open
            self.add_to_open(bw_successors)
            backward_open = self.open_nodes

        return None



class MySTRIPS(STRIPS):
    
    def get_instanciations(self, op, state):
        constants = state_constants(state)
        
        if not op.args:
            act = op.instanciate([])
            if act and all(pre in state for pre in act.pc):
                return [act]
            return []
        
        actions = []
        from itertools import product
        
       
        all_combinations = list(product(constants, repeat=len(op.args)))
        
        
        for combo in all_combinations:
           
            act = op.instanciate(list(combo))
            
            if act:
                
                valid = True
                for pre in act.pc:
                    if pre not in state:
                        valid = False
                        break
                
                if valid:
                    actions.append(act)
        
        
        actions.sort(key=lambda a: str(a.args) if a.args else '')
        return actions
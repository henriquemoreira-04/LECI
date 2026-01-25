from bayes_net import *

# Crear la red
bn = BayesNet()



variables = ['wo', 'tp', 'wf', 'mf', 'nh', 'ae']



# P(wo): "60% dos utilizadores têm sobrecarga de trabalho"
bn.add('wo', [], 0.60)

# P(tp): "utilizadores passam 5% do seu tempo... no processador de texto"
bn.add('tp', [], 0.05)




bn.add('ae', [('wo', True)],  0.90)
bn.add('ae', [('wo', False)], 0.001)


bn.add('nh', [('tp', True)],  0.25)
bn.add('nh', [('tp', False)], 0.004)



bn.add('wf', [('wo', True),  ('nh', True)],  0.02)
bn.add('wf', [('wo', True),  ('nh', False)], 0.01)
bn.add('wf', [('wo', False), ('nh', True)],  0.011)
bn.add('wf', [('wo', False), ('nh', False)], 0.001)



bn.add('mf', [('tp', False), ('nh', True)],  0.10)
bn.add('mf', [('tp', False), ('nh', False)], 0.01)
# Cuando tp=True, es 90% sin importar nh
bn.add('mf', [('tp', True),  ('nh', True)],  0.90)
bn.add('mf', [('tp', True),  ('nh', False)], 0.90)




# Calculamos la probabilidad marginal P(nh = True)
prob_help = bn.individualProb('nh', True)
print(f"Probabilidad a priori de necesitar ayuda P(nh=True): {prob_help:.5f}")

# También podemos probar calcular la probabilidad conjunta de todo True (opcional)
conjunction = [('wo',True),('tp',True),('ae',True),('nh',True),('wf',True),('mf',True)]
print(f"Probabilidad conjunta (todo True): {bn.jointProb(conjunction):.8f}")



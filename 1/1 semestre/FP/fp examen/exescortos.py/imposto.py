#Escreva um programa que calcule o imposto sobre rendimento de vários contribuintes. 
# Use a instrução dada para pedir o rendimento anual e calcule o imposto através da fórmula:
# Imposto = Taxa de imposto * Rendimento - Deducao,
#onde T é a taxa de imposto e D é a dedução, que dependem do rendimento segundo a tabela seguinte.
#Rendimento       T: Taxa de Imposto     D: Dedução
#até 10000.00 €    5%    0.00 €
#entre 10000.00 e 20000.00 €    10%    500.00 €
#mais que 20000.00 €    15%    1500.00 €

def imposto(r):
   i = 0
   if r <= 10000.0:
      t = 0.05
      d = 0.0
      i = (t*r) -d
   
   elif 10000.00 < r <= 20000.0:
      t = 0.10
      d = 500.00
      i = (t*r) -d
   else:
      t = 0.15
      d = 1500.00
      i = (t*r) -d
      
   return i

# Use esta instrução / Use this instruction:
r = int(input("Rendimento? "))    # Income?
imposto(r)
print("Imposto: {:.2f}".format(imposto(r)))
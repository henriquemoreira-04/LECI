"""
This program generates 20 terms of a sequence by a recurrence relation.
Change it to show all positive terms of the sequence and count them.
Format the columns to make the output look like this:
   n        Un
   0   100.000
   1    99.990
   2    99.980
"""

print(f"{'n':>3} {'Un':>10}")
Un = 100 # Un = each term of the sequence. Initially = U0
n = 0
contador = 0
while Un > 0:
    print(f"{n:>3d} {Un:>10.3f}")
    Un = 1.01*Un - 1.01# Set Un to the next term of the sequence
    n +=1
    contador +=1
   
print("el contados es {}".format(contador))

# ojo con esto sin el format 
# print(f"{cosa:lo que quiero}")
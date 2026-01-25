x1 = float(input("n1?: "))
x2 = float(input("n2?: "))
x3 = float(input("n3?:"))
# Use a conditional statement instead of max function!

m = x1 if x1 > x2 else x2
    
m = m if m > x3 else x3
 
     

print("Maximum:",m )

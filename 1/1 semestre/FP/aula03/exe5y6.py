def max(x1,x2):
    return x1 if x1 > x2 else x2 

def max3(x1,x2,x3):
    
    x = max(x1,x2)
    
    return x3 if x3 > x else x

print(max3(3,1,2)) 
    
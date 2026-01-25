s = 0
for m in range(4,-1,-1):
    x =(-1)**(m) * (2**m)
    s += x
    if m%2 != 1:
        print(x,end='')
    else:
        print(x,end='+')
else:
    print('=',s,sep='')
print("Value x:", x)
print("Value m:", m)
print("Value s:", s)

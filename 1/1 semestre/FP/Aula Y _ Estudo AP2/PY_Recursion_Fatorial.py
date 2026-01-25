def fatorial(n):
	if (n==0 or n==1):
		return 1
	else:
		return n*fatorial(n-1)

import math
for n in range(994):
	assert math.factorial(n)==fatorial(n)
print("All tests passed!")
print("[Note] Factorial function tested for values between 0 and 993.")


# coding: utf-8
# This program finds the maximum of two numbers.
# It uses the built-in max function.
# Can you do it with a conditional statement (if / if-else) instead?

x1 = float(input("n1? "))
x2 = float(input("n2? "))

# Use a conditional statement instead of max function!
w = x1 if x1 > x2 else x2

print("Maximum:",w )


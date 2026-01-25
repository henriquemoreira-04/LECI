"""
This program contains lists of students enrolled in Math and Programming
courses.
Use set operations to complete the tasks and answer the questions
shown in comments.
"""

# List of Math students
math_students = ["Alice", "Bob", "Frank"]

# List of Programming students
prog_students = ["Bob", "Diana", "Eve", "Charlie", "Mary"]

# Convert the lists to sets
math_set = set(math_students)
prog_set = set(prog_students)

# Add a new student, Charlie, to the Math course
# and remove Mary from the Programming course
math_set.add("Charlie")
prog_set.discard("Mary")

# Print the sets
print("Math students:", math_set)
print("Programming students:", prog_set)

# Determine the set of all students
all_students = math_set.union(prog_set)
print("All students:", all_students)

# And the set of students in both courses
both_courses = math_set.intersection(prog_set)
print("Students in both courses:", both_courses)

# The set of students taking Math, but not Programming
only_math = math_set.difference(prog_set)
print("Students only in Math:", only_math)

# Answer True or False to each question (using set operations)
alice_in_math = "Alice" in math_set
print("Is Alice in Math?", alice_in_math)

all_math_in_prog = math_set.issubset(prog_set)
print("Are all Math students also in Programming?", all_math_in_prog)


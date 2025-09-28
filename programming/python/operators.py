# -------------------------------
# Task 1: Arithmetic Operators
# -------------------------------
a = 15
b = 4

print("Task 1: Arithmetic Operators")
print("a + b =", a + b)   # Sum
print("a - b =", a - b)   # Difference
print("a * b =", a * b)   # Product
print("a / b =", a / b)   # Quotient
print()

# -------------------------------
# Task 2: Comparison Operators
# -------------------------------
print("Task 2: Comparison Operators")
print("a < b :", a < b)
print("a > b :", a > b)
print("a <= b:", a <= b)
print("a >= b:", a >= b)
print("a == b:", a == b)
print("a != b:", a != b)
print()

# -------------------------------
# Task 3: Logical Operators
# -------------------------------
x = True
y = False

print("Task 3: Logical Operators")
print("x and y:", x and y)
print("x or y :", x or y)
print("not x  :", not x)
print()

# -------------------------------
# Task 4: Assignment Operators
# -------------------------------
total = 10
print("Task 4: Assignment Operators")
total += 5   # total = total + 5
total -= 3   # total = total - 3
total *= 2   # total = total * 2
total /= 4   # total = total / 4
print("Final value of total:", total)
print()

# -------------------------------
# Task 5: Bitwise Operators 
# -------------------------------
m = 6   # Binary: 110
n = 3   # Binary: 011

print("Task 5: Bitwise Operators")
print("m & n  (AND):", m & n)   # 110 & 011 = 010 (2)
print("m | n  (OR) :", m | n)   # 110 | 011 = 111 (7)
print("m ^ n  (XOR):", m ^ n)   # 110 ^ 011 = 101 (5)
print("~m     (NOT):", ~m)      # Bitwise NOT
print("m << 1 (Left shift):", m << 1)  # Shift left
print("m >> 1 (Right shift):", m >> 1) # Shift right
print()

# -------------------------------
# Task 6: Identity & Membership
# -------------------------------
my_list = [1, 2, 3, 4, 5]

p = my_list
q = [1, 2, 3, 4, 5]

print("Task 6: Identity and Membership Operators")
print("p is my_list:", p is my_list)       # True
print("q is my_list:", q is my_list)       # False (different objects)
print("p is not q  :", p is not q)         # True

print("3 in my_list    :", 3 in my_list)   # True
print("10 not in list  :", 10 not in my_list) # True

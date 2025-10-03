# Python program to compare List vs Set

# List allows duplicates and preserves order
my_list = [10, 20, 20, 30, 40, 10]
print("List:", my_list)

# Set does not allow duplicates and does not guarantee order
my_set = {10, 20, 20, 30, 40, 10}
print("Set:", my_set)

# Accessing elements
print("\nAccessing elements:")
print("First element of list:", my_list[0])
# For set, no indexing possible
print("You cannot directly access by index in set.")

# Membership check (fast in sets)
print("\nMembership check:")
print("Is 20 in list?", 20 in my_list)
print("Is 20 in set?", 20 in my_set)

# Adding elements
print("\nAdding elements:")
my_list.append(50)
print("List after adding 50:", my_list)

my_set.add(50)
print("Set after adding 50:", my_set)

# Removing elements
print("\nRemoving elements:")
my_list.remove(20)  # removes first occurrence
print("List after removing 20:", my_list)

my_set.remove(20)  # removes element if present
print("Set after removing 20:", my_set)

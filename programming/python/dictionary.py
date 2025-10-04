# 1. A dictionary is written inside {}
# 2. It stores data as key: value pairs
# 3. Values can be accessed using the key name (like person["name"])

# Creating a dictionary
my_dict = {
        'name': 'Suchithra',
        'phonenum': 123456789,
        'city': 'Chennai'
        }

# Accessing Values
print(my_dict['name'])  # Output: Suchithra

# Modifying and Adding Elements
my_dict['phonenum'] = 987654321  # Modifying a value
my_dict['occupation'] = 'Engineer'  # Adding a new key-value pair

# Removing Elements
del my_dict['city']  # Removing a key-value pair

# Checking Key Existence
if 'phonenum' in my_dict:
    print('Phonenum is present in the dictionary')

# Iterating Through Keys and Values
for key, value in my_dict.items():
    print(key, ":", value)

#1.String Concatenation
str1 = "Hello"
str2 = "World"
result = str1 + " " + str2
print("Concatenated string: ", result)
print()

#2.Length of the String
text = "Python is awesome"
length = len(text)
print("Length of the string: ", length)
print()

#3.Uppercase & Lowercase
uppercase = text.upper()
lowercase = text.lower()
print("Uppercase: ", uppercase)
print()
print("Lowercase: ", lowercase)
print()

#4.Replace the string
new_text = text.replace("awesome", "great")
print("Replace - Modified text: ", new_text)
print()

#5.Split String
words = text.split()
print("Words after splitting: ", words)
print()

#6.Stripping the spaces around the string
text = "         Some spaces around        "
stripped_text = text.strip()
print("Stripped text(leading & trailing spaces stripped): ", stripped_text)
print()

#7.substring
substring = "is"
if substring in text:
    print("substring : ", substring, " found in the text")


#############################
#Execution:
#python3 string-operations.py

#Expected ouput:
#Concatenated string:  Hello World

#Length of the string:  17

#Uppercase:  PYTHON IS AWESOME

#Lowercase:  python is awesome

#Replace - Modified text:  Python is great

#Words after splitting:  ['Python', 'is', 'awesome']

#Stripped text(leading & trailing spaces stripped):  Some spaces around
#################################

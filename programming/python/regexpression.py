import re

# re.match() →checks only at the start of the string.

# re.search() → finds the first occurrence anywhere in the string.

# re.findall() → returns all matches in a list.


#1. findall, search

text = "The quick brown fox"
pattern = r"brown"

search = re.search(pattern, text)
if search:
        print("Pattern found:", search.group())

else:
    print("Pattern not found")

#2. replacement

text2 = "The quick brown fox jumps over the lazy brown dog"
pattern2 = r"brown"

replacement = "red"

new_text = re.sub(pattern2, replacement, text2)
print("Modified text:", new_text)

#3. match

text3 = "The quick black fox"
pattern3 = r"black"

match = re.match(pattern3, text3)
if match:
    print("Match found:", match.group())
else:
    print("No match")
	
#4. split

text = "apple,banana,orange,grape"
pattern = r","

split_result = re.split(pattern, text)
print("Split result:", split_result)
	
	

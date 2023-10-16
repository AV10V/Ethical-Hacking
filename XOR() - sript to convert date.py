#/bin/phyton3
def xor_string_with_integer(input_string, xor_value):
    result = ""
    for char in input_string:
        # Convert the character to its Unicode code point, XOR with xor_value, and convert it back to a character
        xored_char = chr(ord(char) ^ xor_value)
        result += xored_char
    return result

# Example usage:
label = "label"
xored_label = xor_string_with_integer(label, 13)
print("Original Label:", label)
print("XORed Label:", xored_label)

#In this example, the xor_string_with_integer function takes 
#an input string and XORs each character with the integer 13. 
#The ord() function is used to get the Unicode code point of a character, 
#the XOR operation is performed, 
#and then the result is converted back to a character using chr(). 
#You can use this function to XOR any string with the integer 13 
#or any other value.
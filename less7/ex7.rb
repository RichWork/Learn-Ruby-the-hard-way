# Print text strings
puts "Mary had a little lamb."
# Note that the #{} does not contain a variable but a text string 'snow'
puts "Its fleece was white as #{'snow'}."
# puts "Its fleece was white as #{"snow"}." # Using "" instead of '' also works
puts "And everywhere that Mary went."

# Prints . 10 times
puts "." * 10 # what'd that do?

# Creates a bunch of single letter text variables
end1 = "C"
end2 = "h"
end3 = "e"
end4 = "e"
end5 = "s"
end6 = "e"
end7 = "B"
end8 = "u"
end9 = "r"
end10 = "g"
end11 = "e"
end12 = "r"

#watch that print vs. puts on this line what's it do?
print end1 + end2 + end3 + end4 + end5 + end6
puts end7 + end8 + end9 + end10 + end11 + end12

# testing what happens with puts only
puts end1 + end2 + end3 + end4 + end5 + end6
puts end7 + end8 + end9 + end10 + end11 + end12

# testing what happens with print last - it ends up eating into the terminal prompt
puts end1 + end2 + end3 + end4 + end5 + end6
print end7 + end8 + end9 + end10 + end11 + end12

# print function does not start a new line after printing the text string

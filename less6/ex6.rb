# Initial variable
types_of_people = 10

# Variable created as a string with a variable embedded
x = "There are #{types_of_people} types of people."
# Testing ' instead of "
x2 = 'There are #{types_of_people} types of people.'

# Variables as strings
binary = 'binary'
do_not = "don't"

# Variable with a string variable embedded
y = "Those who know #{binary} and those who #{do_not}."
# Testing ' instead of "
y2 = 'Those who know #{binary} and those who #{do_not}.'

# Prints the variables
puts x
puts y

# Using "" means that any additional "" is ignored as it acts as the closure. Note I used '' to print ""
puts "This is using '' instead of "'""'
puts x2
puts y2

# Prints text with an embedded variable which is a string with number and text variables embedded
puts "I said: #{x}."
puts "I also said: '#{y}'."

# As before, testing ' instead of "
puts "This is using '' instead of "'""'
puts "I said: #{x2}."
puts "I also said: '#{y2}'."

# Variable with string and then text variable with variable embedded
hilarious = false
joke_evaluation = "Isn't that joke so funny?! #{hilarious}"

# Prints variable above with embedded text variable
puts joke_evaluation

# Creates two text Variables
w = "This is the left side of..."
e = "a string with a right side."

# Prints both variables with no gap between them
puts w + e
# puts w - e # results in an error, probably can't minus a text string from a text string!

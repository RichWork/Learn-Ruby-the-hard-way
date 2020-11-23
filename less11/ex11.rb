print "How old are you? "
age = gets.chomp
print "How tall are you? "
height = gets.chomp
print "How much do you weigh? "
weight = gets.chomp

puts "So, you're #{age} old, #{height} tall and #{weight} heavy."

# inspect the variable
p weight

# gets adds a \n at the end of the text input from the user
# gets.chomp removes the \n at the end of the input
print "How old are you? "
age = gets
print "How tall are you? "
height = gets
print "How much do you weigh? "
weight = gets

puts "So, you're #{age} old, #{height} tall and #{weight} heavy."

# inspect the variable - shows the \n
p weight

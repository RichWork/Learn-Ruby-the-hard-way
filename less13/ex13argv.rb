# Requests user to input variables
puts "Give us the first variable: "
first = $stdin.gets.chomp
puts "Give us the second variable: "
second = $stdin.gets.chomp
puts "Give us the third variable: "
third = $stdin.gets.chomp

# Overrides variables above as this takes from the command line
first, second, third = ARGV

# Prints variable values
puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"

# Requests user input
puts "Give us a fourth variable: "
fourth = $stdin.gets.chomp

# Prints variable value
puts "Your fourth variable is: #{fourth}"

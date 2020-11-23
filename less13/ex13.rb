# Input argument variables
first, second, third = ARGV

# Prints variable values
puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"

# Requests user input using $stdin.gets.chomp
puts "Give us a fourth variable: "
fourth = $stdin.gets.chomp

# Prints variable value
puts "Your fourth variable is: #{fourth}"

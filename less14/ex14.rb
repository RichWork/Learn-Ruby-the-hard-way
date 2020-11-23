# Used to get a single input argument from the command line
user_name = ARGV.first # gets the first argument

# My change to answer study drill, inputs 2 arguments from command line
user_name, user_age = ARGV

# Creates a prompt icon, note it can work with " or '
#prompt = '> '
prompt = 'ANSWER: '

# Asks questions, uses input ARGV to identify user
puts "Hi #{user_name}."
puts "I'd like to ask you a few questions."
puts "Are you #{user_age} years old? "
puts prompt
age = $stdin.gets.chomp

puts "Do you like me #{user_name}? "
puts prompt
likes = $stdin.gets.chomp

puts "Where do you live #{user_name}? "
puts prompt
lives = $stdin.gets.chomp

# a comma for puts is like using it twice
# Note the comma after the puts part, this allows the next command line on the same line
puts "What kind of computer do you have? ", prompt
computer = $stdin.gets.chomp

# Outputs the answers, note using """ to fix format and also allow #{}
puts """
Alright, so you said #{age} about your age.
You said #{likes} about liking me.
You live in #{lives}. Not sure where that is.
And you have a #{computer} computer. Nice.
"""

# Input from command line for the sample file
input_file = ARGV.first

# Opens the input file from command line
current_file = open(input_file)

# It seems that get.chomp on a file will read one line at a time
puts "Let's print line 1:"

puts current_file.gets.chomp

puts "Let's print line 2:"

puts current_file.gets.chomp

puts "Let's print line 3:"

puts current_file.gets.chomp

# Gets filename from command input
filename = ARGV.first

# Asks user to cancel the script if file wants to be kept
puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

# Asks for user input, mostly though its just a pause line
$stdin.gets

# Opens the file with w format
puts "Opening the file..."
target = open(filename, 'w')

# Deletes the contents of the file from line 0
puts "Truncating the file. Goodbye!"
target.truncate(0)

# Asks user for 3 new lines
puts "Now I'm going to ask you for three lines."

print "Line 1: "
line1 = $stdin.gets.chomp
print "Line 2: "
line2 = $stdin.gets.chomp
print "Line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."

# Writes the lines into the file object, and adds a new line between each as
# the gets command above used .chomp which removed the /n
target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

# Closes the file
puts "And finally, we close it."
target.close

# Gets filename from command input
filename = ARGV.first

# Asks user to cancel the script if file wants to be kept
puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

# Asks for user input, mostly though its just a pause line
$stdin.gets

# Opens the file in a write format
puts "Opening the file..."
target = open(filename, 'w')

# Opens the file in both a read and write format, truncate still not necessary
#puts "Opening the file..."
#target = open(filename, 'r+')

# Opens the file in both an append format - requires truncate to delete data
#puts "Opening the file..."
#target = open(filename, 'a+')

# Opens the file in a format which doesn't allow writing
#target = open(filename)

# Deletes the contents of the file from line 0
# As this file has been opened in 'w' mode, then truncate is not necessary,
# as the write mode overwrites the whole file anyway. 'r+' also follows this
# aspect, if using 'a+' format then new lines will be appended
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

# Creates an output from the user input, but feels a bit wrong
#full = """#{line1}
#{line2}
#{line3}
#"""

# Creates an output from the uesr input, but feels a bit better?
full = "#{line1}\n#{line2}\n#{line3}"

# Writes the lines into the file object, and adds a new line between each as
# the gets command above used .chomp which removed the /n
target.write(full)

# Closes the file
puts "And finally, we close it."
target.close

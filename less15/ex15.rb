# Input argument of the filename (text file) to print
filename = ARGV.first

# Opens the file as an object and creates a variable for it, note this is just
# a file object not the contents, a file object has options, like read
txt = open(filename)

# Prints the file
puts "Here's your file #{filename}:"

# Reads the contents of the file and prints it
print txt.read

# Requests the user to choose the filename, leaving it blank causes an error
print "Type the filename again: "
file_again = $stdin.gets.chomp

# Opens the file again and assigns a variable
txt_again = open(file_again)

# Reads the file and prints it again
print txt_again.read

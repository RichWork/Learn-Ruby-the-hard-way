# Input from command line for the sample file
input_file = ARGV.first

# Function to read the whole file and display it
def print_all(f)
  puts f.read
end

# Function to "rewind" to the start of the file, technically it is seeking byte 0
# e.g. the start of the file, note that seek deals in bytes not lines
def rewind(f)
  f.seek(0)
end

# Function to display the line being read and the file name?
def print_a_line(line_count, f)
  puts "#{line_count}, #{f.gets.chomp}"
end

# Opens the input file from command line
current_file = open(input_file)

# Run the function to print the whole file
puts "First let's print the whole file:\n"
# Note that the input argument is the open file
print_all(current_file)

# Test to see what happens if print all again. Answer is nothing is printed
# The read position must be reset
#puts "Now let's print the whole file again:\n"
# Note that the input argument is the open file
#print_all(current_file)

puts "Now let's rewind, kind of like a tape."
# Note that the function actually goes back to position 0 in the file
rewind(current_file)

puts "Let's print three lines:"
# Not sure this is printing the content of the file, as it is calling gets?
current_line = 1
print_a_line(current_line, current_file)

# Note the increment in current_line
current_line = current_line + 1
print_a_line(current_line, current_file)

# Note that += does the same as above
current_line += 1
print_a_line(current_line, current_file)

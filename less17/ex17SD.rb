# Chooses the two files to copy between
from_file, to_file = ARGV

puts "Copying from #{from_file} to #{to_file}"

#we could do these two on one line, how?
#in_file = open(from_file)
#indata = in_file.read
indata = open(from_file).read

# Displays size of input file - superfluous
#puts "The input file is #{indata.length} bytes long"

# Checks for the existance of the output file - superfluous
#puts "Does the output file exist? #{File.exist?(to_file)}"

# Gets user input before continuing
#puts "Ready, hit RETURN to continue, CTRL-C to abort."
#$stdin.gets

# Writes contents of input file (indata) to output file
out_file = open(to_file, 'w')
out_file.write(indata)

puts "Alright, all done."

# Closes files - not sure if from_file is still open somewhere
out_file.close
#in_file.close

# Gets a number from user, removes the /n and converts to integer
print "Give me a number: "
number = gets.chomp.to_i

# Mutiplies the number and prints it
bigger = number * 100
puts "A bigger number is #{bigger}."

# Gets a number from user, removes the /n
print "Give me another number: "
another = gets.chomp
number = another.to_i

# Divides the number and makes it smaller. Note that using integers will affect division
smaller = number / 100
puts "A smaller number is #{smaller}."

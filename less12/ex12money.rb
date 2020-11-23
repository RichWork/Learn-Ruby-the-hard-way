# Gets money from a user, removes the /n and converts to FP
print "Give me some money: "
number = gets.chomp.to_f

# Mutiplies the number and prints it
p10 = number * 0.1
puts "Here's your money back: #{p10}."

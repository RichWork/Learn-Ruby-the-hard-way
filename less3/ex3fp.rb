# Will print the message about chickens
puts "I will now count my chickens:"

# Prints Hens followed by the calculation. Note that the division runs first.
# Note that the 3%4 creates a 3/4 or 0.75
puts "Hens #{25.0 + 30.0 / 6.0}"
puts "Roosters #{100.0 - 25.0 * 3.0 % 4.0}"

# Will print the message about eggs
puts "Now I will count the eggs:"

# Completes the calculation and prints the output
puts "No FP = #{3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6}"
puts "FP with decimals = #{3.0 + 2.0 + 1.0 - 5.0 + 4.0 % 2.0 - 1.0 / 4.0 + 6.0}"
puts "FP with .to_f = #{3.to_f + 2.to_f + 1.to_f - 5.to_f + 4.to_f % 2.to_f - 1.to_f / 4.to_f + 6.to_f}"

# Prints the message
puts "Is it true that 3 + 2 < 5 - 7?"

# Acts like an if statement, asks if 3+2 is less than 5-7 (false)
puts 3 + 2 < 5 - 7

# Does the sums as shown
puts "What is 3 + 2? #{3 + 2}"
puts "What is 5 - 7? #{5 - 7}"

# Prints the text
puts "Oh, that's why it's false."

# Prints the text
puts "How about some more."

# Prints the statements as if's , e.g. 5 is greater than -2, so true
puts "Is it greater? #{5 > -2}"
puts "Is it greater or equal? #{5 >= -2}"
puts "Is it less or equal? #{5 <= -2}"

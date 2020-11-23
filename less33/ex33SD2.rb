# Initial variable and array setup
numbers = []

(0..6).each do |i| # for loop to go through a 0 to 6 array, with i assigned the value
  puts "At the top i is #{i}" # prints i
  numbers.push(i) # adds i to the end of the array

  # i -= 2 # increment is no longer necessary in a for loop as the (0..6) array
  # is called each time
  puts "Numbers now: ", numbers # prints the array
  puts "At the bottom i is #{i}" # prints i
end

puts "The numbers: "

# remember you can write this 2 other ways?
# For loop
numbers.each {|num| puts num}

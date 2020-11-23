# Initial variable and array setup
i = 0
numbers = []

while i < 6
  puts "At the top i is #{i}" # prints i
  numbers.push(i) # adds i to the end of the array

  i += 1 # increments i
  puts "Numbers now: ", numbers # prints the array
  puts "At the bottom i is #{i}" # prints i
end

puts "The numbers: "

# remember you can write this 2 other ways?
# For loop
numbers.each {|num| puts num}

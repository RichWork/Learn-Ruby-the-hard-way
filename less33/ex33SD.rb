# Running as a function
def looprun(i, j, k, l)
while i < 6
  puts "At the top i is #{i}" # prints i
  k.push(i) # adds i to the end of the array

  i += l # increments i by l
  puts "Numbers now: ", k # prints the array
  puts "At the bottom i is #{i}" # prints i
end
return k
end

k = looprun(0, 6, [], 1)

# remember you can write this 2 other ways?
# For loop
puts "The numbers: "
k.each {|num| puts num}

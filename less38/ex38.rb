ten_things = "Apples Oranges Crows Telephone Light Sugar"

puts "Wait there are not 10 things in that list. Let's fix that."

stuff = ten_things.split(' ') # Splits the string by spaces
more_stuff = ["Day", "Night", "Song", "Frisbee", "Corn", "Banana", "Girl", "Boy"]

# using math to make sure there's 10 items
while stuff.length != 10
  next_one = more_stuff.pop # removes the last item from more_stuff and saves it
  puts "Adding: #{next_one}"
  stuff.push(next_one) # adds the removed item to the stuff array
  puts "There are #{stuff.length} items now."
end

puts "There we go: #{stuff}"

puts "Let's do some things with stuff."

puts stuff[1] # Second element in array
puts stuff[-1] # Final element in array
puts stuff.pop() # Removes final element in the array and "puts" it
puts stuff.join(' ') # Joins all elements in the array with a ' ' between
puts stuff[3..5].join('#') # Joins elements 3 to 5 with a '#' between

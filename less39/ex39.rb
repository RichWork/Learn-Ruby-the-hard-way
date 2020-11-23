# create a mapping of state to abbreviation
states = {
  'Oregon' => 'OR',
  'Florida' => 'FL',
  'California' => 'CA',
  'New York' => 'NY',
  'Michigan' => 'MI'
}

# create a basic set of states and some cities in them
cities = {
  'CA' => 'San Francisco',
  'MI' => 'Detroit',
  'FL' => 'Jacksonville'
}

# add some more cities
cities['NY'] = 'New York'
cities['OR'] = 'Portland'

# puts out some cities
puts '-' * 10
puts "NY State has: #{cities['NY']}"
puts "OR State has: #{cities['OR']}"

# puts some states
puts '-' * 10
puts "Michigan's abbreviation is: #{states['Michigan']}"
puts "Florida's abbreviation is: #{cities['Florida']}"

# do it by using the state then cities dict
# Note that the states hash pulls the abbreviation which is used by the cities
# hash to call the city name
puts '-' * 10
puts "Michigan has: #{cities[states['Michigan']]}"
puts "Florida has: #{cities[states['Florida']]}"

# puts every state abbreviation - using for-loop
puts '-' * 10
states.each do |state, abbrev| # Note that the state and abbrev are variable names
  # defined here, not defined by the hash
  puts "#{state} is abbreviated #{abbrev}"
end

# puts every city in state - using for-loop
puts '-' * 10
cities.each do |abbrev, city| # Note that the city and abbrev are variable names
  # defined here, not defined by the hash
  puts "#{abbrev} has the city #{city}"
end

# now do both at the same time - using for loop which calls on the cities hash
puts '-' * 10
states.each do |state, abbrev|
  city = cities[abbrev]
  puts "#{state} is abbreviated #{abbrev} and has city #{city}"
end

puts '-' * 10
# by default ruby says "nil" when something isn't in there
state = states['Texas']

if !state # detects a nil stored in the state variable
  puts "Sorry, no Texas."
end

# default values using ||= with the nil result
city = cities['TX']
city ||= 'Does Not Exist' # ||= is an assignment operator, if city is nil or
# false, it assigns the value here
puts "The city for the state of 'TX' is #{city}"

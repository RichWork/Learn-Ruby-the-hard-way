# Variable list
# Number of cars available
cars = 100

# Space in a car variable, does not include driver, note it is FP, but not really necessary
space_in_a_car = 4.0
# space_in_a_car = 4

# Drivers available to drive the cars
drivers = 30

# Number of passengers requiring transport
passengers = 90

# Calculations using variables
cars_not_driven = cars - drivers
cars_driven = drivers
carpool_capacity = cars_driven * space_in_a_car
average_passengers_per_car = passengers / cars_driven


# Printing output
puts "There are #{cars} cars available."
puts "There are only #{drivers} drivers available."
puts "There will be #{cars_not_driven} empty cars today."
puts "We can transport #{carpool_capacity} people today."
puts "We have #{passengers} to carpool today."
puts "We need to put about #{average_passengers_per_car} in each car."


# Study drill
# Error mentioned is likely due to missing the carpool_capacity variable as a calculation
# Study drill 1 - using 4.0 makes it a floating point, using 4 will remove FP,
# it doesn't really matter in this case as the calculation it is used in results in an integer
# but if it was a fraction, it would be lost in the rounding.
#

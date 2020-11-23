name = 'Zed A. Shaw'
age = 35 # not a lie in 2009
height_inch = 74 # inches
h_conv = 2.5 # approximate conversion of inches to cm
height = height_inch * h_conv
weight_lbs = 180 # lbs
w_conv = 0.454 # approximate conversion of pounds to kg
weight = weight_lbs * w_conv
eyes = 'Blue'
teeth = 'White'
hair = 'Brown'


puts "Let's talk about #{name}."
puts "He's #{height} cms tall."
puts "He's #{weight} kg heavy."
puts "Actually that's not too heavy."
puts "He's got #{eyes} eyes and #{hair} hair."
puts "His teeth are usually #{teeth} depending upon the coffee."

# this line is tricky, try to get it exactly right
puts "If I add #{age}, #{height}, and #{weight} I get #{age + height + weight}."

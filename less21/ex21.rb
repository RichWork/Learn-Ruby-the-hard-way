# Function for adding
def add(a, b)
  puts "ADDING #{a} + #{b}"
  return a + b # This is the output as the return output of the function
end

# Function for subtracting, note that the return has been removed and the
# function will still return the output, as ruby assumes the last expression is
# an output
def subtract(a, b)
  puts "SUBTRACTING #{a} - #{b}"
  a - b # This is the output as the final expression of the function
end

# Function for multiplying, note that the return has been removed and the
# function returns the final expression as the output (a*b) not the (a+b)
def multiply(a, b)
  puts "MULTIPLYING #{a} * #{b}"
  a + b # This is ignored as the output due to not being the final expression
  a * b
end

# Function for dividing, note that the expression a + b does not form the output
# of the function, only the return expression does.
def divide(a, b)
  puts "DIVIDING #{a} / #{b}"
  return a / b
  a + b # This is ignored as the output due to the return
end

puts "Let's do some math with just functions!"

age = add(30, 5)
height = subtract(78, 4)
weight = multiply(90 ,2)
iq = divide(100, 2)

puts "Age: #{age}, Height: #{height}, Weight: #{weight}, IQ: #{iq}"

# A puzzle for the extra credit, type it in anyway
puts "Here is a puzzle."

# Note that ruby will work from the innermost bracket first, e.g. the divide
what = add(age, subtract(height, multiply(weight, divide(iq, 2))))

puts "That becomes: #{what}. Can you do it by hand?"

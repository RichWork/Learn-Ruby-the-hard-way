# Introduction text, note that the escapes in line 4 do not create new lines or
# tabs due to the use of ''
puts "Let's practice everything."
puts 'You\'d need to know \'bout escapes with \\ that do \n newlines and \t tabs.'

# the <<END is a "heredoc". See the Student Questions.
poem = <<END
\tThe lovely world
with logic so firmly planted
cannot discern \n the needs of lovely
nor comprehend passion from intuition
and requires an explanation
\n\t\twhere there is none.
END

puts "----------------"
puts poem
puts "----------------"

# basic maths
five = 10 - 2 + 3 - 6
puts "This should be five: #{five}"

# Function which creates three outputs using the return expression
def secret_formula(started)
  jelly_beans = started * 500
  jars = jelly_beans / 1000
  crates = jars / 100
  return jelly_beans, jars, crates
end

# Input value for the function, runs the function and creates 3 variables for the three outputs
start_point = 10000
beans, jars, crates = secret_formula(start_point)

puts "With a starting point of: #{start_point}"
puts "We'd have #{beans} beans, #{jars} jars, and #{crates} crates."

# In this case, the formula is called from the end in C style programming
start_point = start_point / 10
puts "We can also do that this way:"
puts "We'd have %s beans, %d jars, and %d crates." % secret_formula(start_point)

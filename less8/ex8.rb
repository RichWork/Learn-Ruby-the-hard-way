# Creates the string variable with input variables
formatter = "%{first} %{second} %{third} %{fourth}"

# Prints the string variable formatter, and inserts the values in the %{}
# Note that integers don't need to be ""
puts formatter % {first: 1, second: 2, third: 3, fourth: 4}
# Note that text strings require "" or ''
puts formatter % {first: "one", second: "two", third: "three", fourth: "four"}
# Note that true and false are understood by Ruby as values without ""
puts formatter % {first: true, second: false, third: true, fourth: false}
# Note that formatter is behaving as a string and being printed
puts formatter % {first: formatter, second: formatter, third: formatter, fourth: formatter}

# As above but the format is spread across multiple lines using ,
puts formatter % {
  first: "I had this thing.",
  second: "That you could type up right.",
  third: "But it didn't sing.",
  fourth: "So I said goodnight."
}

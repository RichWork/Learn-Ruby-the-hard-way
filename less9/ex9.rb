# Here's some new strange stuff, remember type it exactly

days = "Mon Tue Wed Thu Fri Sat Sun"
months = "\nJan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"

puts "Here are the days: #{days}"
puts "Here are the months: #{months}"

# Forces the text to be spread across multiple lines, acts as a direct quote
# Note, also disables variable embedding using #{}
puts %q{
There's something going on here.
With this weird quote
We'll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
}

# Creating a variable
x = 5

puts %q{
There's something going on here.
"With this weird quote"
'We'll be able to type as much as we like.'
Even 4 lines if we want, or #{x}, or 6.
}

# Note, the "q" forces a direct quote, removing the q allows #{} and it is still
# spread over multiple lines
puts %{
There's something going on here.
"With this weird quote"
'We'll be able to type as much as we like.'
Even 4 lines if we want, or #{x}, or 6.
}

# Note, the "Q" is like above but not sure
puts %Q{
There's something going on here.
"With this weird quote"
'We'll be able to type as much as we like.'
Even 4 lines if we want, or #{x}, or 6.
}

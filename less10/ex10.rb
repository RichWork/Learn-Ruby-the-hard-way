# Text Variables
# \t adds a tabbed indent
tabby_cat = "\tI'm tabbed in."
# \n splits the text over 2 lines
persian_cat = "I'm split\non a line."
# \\ adds \ as part of the text
backslash_cat = "I'm \\ a \\ cat."

# """ allows all the text in between the two """ to be printed in "" style
fat_cat = """
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
"""


# using ''' instead of """ behaves like '' instead of "", which prevents
# variable embedding and stops the escape sequences from working
# Note that I had to use the \' escape sequence for "I'll" as it killed the code
fat_cat2 = '''
I\'ll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
'''

# Prints everything.
puts tabby_cat
puts persian_cat
puts backslash_cat
puts fat_cat
puts fat_cat2

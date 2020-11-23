def gold_room
  puts "This room is full of gold. How much do you take?"

  print "> "
  choice = $stdin.gets.chomp

  # this line has a bug, so fix it
  #if choice.include?("0") || choice.include?("1") # original line
# Suggested replacement, =~ is a pattern match, which goes through a string,
# the \d is for any digit (numeric but still a string), + means one or more times
# Not sure if the + is necessary
# Note that the if statement is not technically a Boolean statement, as it returns
# the position of the digit in "choice", but if it fails, it goes to nil, Which
# seems to be interpreted as a false
  if choice =~ /\d+/
    how_much = choice.to_i # Converst the string input to an integer
  else
    dead("Man, learn to type a number.")
  end

if how_much < 50
  puts "Nice, you're not greedy, you win!"
  exit(0)
else
  dead("You greedy bastard!")
end
end


def bear_room
  puts "There is a bear here."
  puts "The bear has a bunch of honey."
  puts "The fat bear is in front of another door."
  puts "How are you going to move the bear?"
  bear_moved = false

# Note "while true" creates an infinite loop, notice that all choices afterwards
# will break the loop and trigger a different program
  while true
    print "> "
    choice = $stdin.gets.chomp

    if choice == "take honey"
      dead("The bear looks at you then slaps your face off.")
    elsif choice == "taunt bear" && !bear_moved
      puts "The bear has moved from the door. You can go through it now."
      bear_moved = true
    elsif choice == "taunt bear" && bear_moved
      dead("The bear gets pissed off and chews you leg off.")
    elsif choice == "open door" && bear_moved
      gold_room
    else
      puts "I got no idea what that means." # This does not break the loop and instead
      # reloops to the beginning
    end
  end
end


def cthulhu_room
  puts "Here you see the great evil Cthulhu."
  puts "He, it, whatever stares at you and you go insane."
  puts "Do you flee for your life or eat your head?"

  print "> "
  choice = $stdin.gets.chomp

  if choice.include? "flee"
    start
  elsif choice.include? "head"
    dead("Well that was tasty!")
  else
    cthulhu_room
  end
end


def dead(why)
  puts why, "Good job!"
  exit(0)
end

def start
  puts "You are in a dark room."
  puts "There is a door to your right and left."
  puts "Which one do you take?"

  print "> "
  choice = $stdin.gets.chomp

  if choice == "left"
    bear_room
  elsif choice == "right"
    cthulhu_room
  else
    dead("You stumble around the room until you starve.")
  end
end

start

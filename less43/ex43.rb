class Scene
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()"
    exit(1)
  end
  def scan_code(code,guess)
    # I made this code to make the random number generator puzzle a bit less gruelling
    # Basically it creates a light display indicating if a number is correct
    code_split = code.split('') # code is a string and is split into an array
    guess_split = guess.split('') # guess is a string and is split into an array
    click = [] # creates an empty array
    (0..2).each do |i| # goes through the 3 numbers, and puts i as the number (0 to 2)
      if guess_split[i] == code_split[i] # checks if the guess matches the code at position i
        click[i] = "Green" # if yes, goes green
      else
        click[i] = "Red" # if no, goes red
      end
    end
    return click.join(', ') # Joins the click array together into a single string separated by ', '
    # This is then returned to the calling function.
  end

end


class Engine

  def initialize(scene_map)
    @scene_map = scene_map # This is an object of a_map, it contains the methods
    # opening_scene and next_scene, along with hash keys of the rooms
  end

  def play()
    # current_scene starts with the opening_scene, which is 'central_corridor'
    current_scene = @scene_map.opening_scene()
    # last_scene is the final scene of the game and breaks out of the loop
    last_scene = @scene_map.next_scene('finished')

# while the current_scene does not equal the last_scene
    while current_scene != last_scene
      # The .enter(), needs to return the next scene name, either a death state
      # or the next room, depending upon player choice
      next_scene_name = current_scene.enter()
      # the current scene will then change, using the .next_scene to load the class
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    # be sure to print out the last scene
    # After breaking out of the loop, this then plays the final scene ('finished')
    current_scene.enter()
  end
end

class Death < Scene
@@quips = [
  "You died. You kinda suck at this.",
  "Your mom would be proud...if she were smarter.",
  "Such a luser.",
  "I have a small puppy that's better at this than you."
]
  def enter()
    # Note that rand will pull an integer and there is a -1 as the quips array starts at 0
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end

class CentralCorridor < Scene

  def enter()
    puts "The Gothons of Planet Percal #25 have invaded your ship and destroyed"
    puts "your entire crew.  You are the last surviving member and your last"
    puts "mission is to get the neutron destruct bomb from the Weapons Armory,"
    puts "put it in the bridge, and blow the ship up after getting into an "
    puts "escape pod."
    puts "\n"
    puts "You're running down the central corridor to the Weapons Armory when"
    puts "a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume"
    puts "flowing around his hate filled body.  He's blocking the door to the"
    puts "Armory and about to pull a weapon to blast you."
    print "> "

    action = $stdin.gets.chomp

  if action == "shoot!"
    puts "Quick on the draw you yank out your blaster and fire it at the Gothon."
    puts "His clown costume is flowing and moving around his body, which throws"
    puts "off your aim.  Your laser hits his costume but misses him entirely.  This"
    puts "completely ruins his brand new costume his mother bought him, which"
    puts "makes him fly into an insane rage and blast you repeatedly in the face until"
    puts "you are dead.  Then he eats you."
    return 'death'

  elsif action == "dodge!"
  puts "Like a world class boxer you dodge, weave, slip and slide right"
  puts "as the Gothon's blaster cranks a laser past your head."
  puts "In the middle of your artful dodge your foot slips and you"
  puts "bang your head on the metal wall and pass out."
  puts "You wake up shortly after only to die as the Gothon stomps on"
  puts "your head and eats you."
  return 'death'

elsif action == "tell a joke"
  puts "Lucky for you they made you learn Gothon insults in the academy."
  puts "You tell the one Gothon joke you know:"
  puts "Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr."
  puts "The Gothon stops, tries not to laugh, then busts out laughing and can't move."
  puts "While he's laughing you run up and shoot him square in the head"
  puts "putting him down, then jump through the Weapon Armory door."
  return 'laser_weapon_armory'

  else
    puts "DOES NOT COMPUTE!"
    return 'central_corridor'
  end
  end
end

class LaserWeaponArmory < Scene

  def enter()
    puts "You do a dive roll into the Weapon Armory, crouch and scan the room"
    puts "for more Gothons that might be hiding.  It's dead quiet, too quiet."
    puts "You stand up and run to the far side of the room and find the"
    puts "neutron bomb in its container.  There's a keypad lock on the box"
    puts "and you need the code to get the bomb out.  If you get the code"
    puts "wrong 10 times then the lock closes forever and you can't"
    puts "get the bomb.  To help, there is a light display indicating"
    puts "a correct guess in a position. The code is 3 digits."

# creates a random code - pretty impossible to beat here
    code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
    print "[keypad]> "
    guess = $stdin.gets.chomp
    guesses = 1

while guesses < 10 && guess != code
  puts "BZZZZEDDD!"
  guesses += 1
  lights = scan_code(code,guess)
  puts "The light display shows " + lights
  print "[keypad]> "
  guess = $stdin.gets.chomp
end

  if guess == code
    puts "The container clicks open and the seal breaks, letting gas out."
    puts "You grab the neutron bomb and run as fast as you can to the"
    puts "bridge where you must place it in the right spot."
    return 'the_bridge'

  else
    puts "The lock buzzes one last time and then you hear a sickening"
    puts "melting sound as the mechanism is fused together."
    puts "You decide to sit there, and finally the Gothons blow up the"
    puts "ship from their ship and you die."
    return 'death'
  end

  end
end

class TheBridge < Scene

  def enter()
    puts "You burst onto the Bridge with the netron destruct bomb"
    puts "under your arm and surprise 5 Gothons who are trying to"
    puts "take control of the ship.  Each of them has an even uglier"
    puts "clown costume than the last.  They haven't pulled their"
    puts "weapons out yet, as they see the active bomb under your"
    puts "arm and don't want to set it off."
    print "> "

    action = $stdin.gets.chomp

    if action == "throw the bomb"
      puts "In a panic you throw the bomb at the group of Gothons"
      puts "and make a leap for the door.  Right as you drop it a"
      puts "Gothon shoots you right in the back killing you."
      puts "As you die you see another Gothon frantically try to disarm"
      puts "the bomb. You die knowing they will probably blow up when"
      puts "it goes off."
      return 'death'

    elsif action == "slowly place the bomb"
      puts "You point your blaster at the bomb under your arm"
      puts "and the Gothons put their hands up and start to sweat."
      puts "You inch backward to the door, open it, and then carefully"
      puts "place the bomb on the floor, pointing your blaster at it."
      puts "You then jump back through the door, punch the close button"
      puts "and blast the lock so the Gothons can't get out."
      puts "Now that the bomb is placed you run to the escape pod to"
      puts "get off this tin can."
      return 'escape_pod'

    else
      puts "DOES NOT COMPUTE!"
      return "the_bridge"
    end
  end
end


class EscapePod < Scene

  def enter()
    puts "You rush through the ship desperately trying to make it to"
    puts "the escape pod before the whole ship explodes.  It seems like"
    puts "hardly any Gothons are on the ship, so your run is clear of"
    puts "interference.  You get to the chamber with the escape pods, and"
    puts "now need to pick one to take.  Some of them could be damaged."
    puts "There's 5 pods, but you only have time to check 3. Which one"
    puts "do you take?"

    good_pod = rand(1..5)

    print "[pod #]> "
    guess = $stdin.gets.chomp.to_i
    guesses = 1

# I changed this bit to include a bit less chance in picking the pod. Still luck but better odds
while guess < 3 && guess != good_pod
  puts "You jump into pod %s and hit the eject button." % guess
  puts "A sad little bzzt noise indicates this escape pod"
  puts "is going nowhere in a hurry. Better try again,"
  puts "only %s guesses remaining!" % [3-guesses]
  # Bugs me a little but when down to 1 guess, it still says "1 guesses"
  guesses += 1
  guess = $stdin.gets.chomp.to_i
end

  if guess != good_pod
    puts "You jump into pod %s and hit the eject button." % guess
    puts "The pod escapes out into the void of space, then"
    puts "implodes as the hull ruptures, crushing your body"
    puts "into jam jelly."
    return 'death'
  else
    puts "You jump into pod %s and hit the eject button." % guess
    puts "The pod easily slides out into space heading to"
    puts "the planet below.  As it flies to the planet, you look"
    puts "back and see your ship implode then explode like a"
    puts "bright star, taking out the Gothon ship at the same"
    puts "time.  You won!"

    return 'finished'
  end
  end
end

class Finished < Scene

  def enter()
    puts "You won! Good job"
  end
end

class Map
  # Scenes are created here and trigger the classes above when called by the Engine
  @@scenes = {
    'central_corridor' => CentralCorridor.new(),
    'laser_weapon_armory' => LaserWeaponArmory.new(),
    'the_bridge' => TheBridge.new(),
    'escape_pod' => EscapePod.new(),
    'death' => Death.new(),
    'finished' => Finished.new()
  }

# this takes the value of the starting scene which is input below when Map is instanced
  def initialize( start_scene)
    @start_scene = start_scene
  end

# This function controls the scene selection, calling the next scene by its hash key
# and returning the class Scene
  def next_scene( scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end


a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()

class Room

  def initialize(name, description)
    @name = name
    @description = description
    @paths = {}
  end

  #these make it easy for you to access the variables, variables above are stuck in the
  attr_reader :name
  attr_reader :paths
  attr_reader :description

  def go(direction)
    return @paths[direction]
  end

  def add_paths(paths)
    @paths.update(paths)
  end

end

# class Death
#
#       def enter(prev_room)
#         @words = []
#         @prev_room = prev_room
#         @words.push(Map::@room_deaths[@prev_room]) # pulls the death scene from the hash
#         # Note that rand will pull an integer and there is a -1 as the quips array starts at 0
#         @words.push(Map::@quips[rand(0..(@quips.length - 1))])
#         return @words.join('')
#         #exit(1)
#       end
# end


module Map

@@code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
@@guesses = 1

@@quips = [
"You died. You kinda suck at this.",
"Your mom would be proud...if she were smarter.",
"Such a luser.",
"I have a small puppy that's better at this than you."
]

@@room_deaths = {
'the_bridge' =>
"""
In a panic you throw the bomb at the group of Gothons
and make a leap for the door.  Right as you drop it a
Gothon shoots you right in the back killing you.
As you die you see another Gothon frantically try to disarm
the bomb. You die knowing they will probably blow up when
it goes off.\n
""",
'central_corridor_shoot' =>
"""
Quick on the draw you yank out your blaster and fire it at the Gothon.
His clown costume is flowing and moving around his body, which throws
off your aim.  Your laser hits his costume but misses him entirely.  This
completely ruins his brand new costume his mother bought him, which
makes him fly into an insane rage and blast you repeatedly in the face until
you are dead.  Then he eats you.\n
""",
'central_corridor_dodge' =>
"""
Like a world class boxer you dodge, weave, slip and slide right
as the Gothon's blaster cranks a laser past your head.
In the middle of your artful dodge your foot slips and you
bang your head on the metal wall and pass out.
You wake up shortly after only to die as the Gothon stomps on
your head and eats you.\n
""",
'laser_weapon_armory' =>
"""
The lock buzzes one last time and then you hear a sickening
melting sound as the mechanism is fused together.
You decide to sit there, and finally the Gothons blow up the
ship from their ship and you die.\n
""",
}

  CENTRAL_CORRIDOR = Room.new("Central Corridor",
    """
    The Gothons of Planet Percal #25 have invaded your ship and destroyed
    your entire crew.  You are the last surviving member and your last
    mission is to get the neutron destruct bomb from the Weapons Armory,
    put it in the bridge, and blow the ship up after getting into an
    escape pod.
    You're running down the central corridor to the Weapons Armory when
    a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume
    flowing around his hate filled body.  He's blocking the door to the
    Armory and about to pull a weapon to blast you.
    """)


  LASER_WEAPON_ARMORY = Room.new("Laser Weapon Armory",
    """
    Lucky for you they made you learn Gothon insults in the academy.
    You tell the one Gothon joke you know:
    Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr.
    The Gothon stops, tries not to laugh, then busts out laughing and can't move.
    While he's laughing you run up and shoot him square in the head
    putting him down, then jump through the Weapon Armory door.
    You do a dive roll into the Weapon Armory, crouch and scan the room
    for more Gothons that might be hiding.  It's dead quiet, too quiet.
    You stand up and run to the far side of the room and find the
    neutron bomb in its container.  There's a keypad lock on the box
    and you need the code to get the bomb out.  If you get the code
    wrong 10 times then the lock closes forever and you can't
    get the bomb.  The code is 3 digits.
    """)


  THE_BRIDGE = Room.new("The Bridge",
    """
    The container clicks open and the seal breaks, letting gas out.
    You grab the neutron bomb and run as fast as you can to the
    bridge where you must place it in the right spot.
    You burst onto the Bridge with the netron destruct bomb
    under your arm and surprise 5 Gothons who are trying to
    take control of the ship.  Each of them has an even uglier
    clown costume than the last.  They haven't pulled their
    weapons out yet, as they see the active bomb under your
    arm and don't want to set it off.
    """)


    ESCAPE_POD = Room.new("Escape Pod",
      """
      You point your blaster at the bomb under your arm
      and the Gothons put their hands up and start to sweat.
      You inch backward to the door, open it, and then carefully
      place the bomb on the floor, pointing your blaster at it.
      You then jump back through the door, punch the close button
      and blast the lock so the Gothons can't get out.
      Now that the bomb is placed you run to the escape pod to
      get off this tin can.
      You rush through the ship desperately trying to make it to
      the escape pod before the whole ship explodes.  It seems like
      hardly any Gothons are on the ship, so your run is clear of
      interference.  You get to the chamber with the escape pods, and
      now need to pick one to take.  Some of them could be damaged
      but you don't have time to look.  There's 5 pods, which one
      do you take?
      """)


  THE_END_WINNER = Room.new("The End",
    """
    You jump into pod 2 and hit the eject button.
    The pod easily slides out into space heading to
    the planet below.  As it flies to the planet, you look
    back and see your ship implode then explode like a
    bright star, taking out the Gothon ship at the same
    time.  You won!
    """)


  THE_END_LOSER = Room.new("The End",
    """
    You jump into a random pod and hit the eject button.
    The pod escapes out into the void of space, then
    implodes as the hull ruptures, crushing your body
    into jam jelly.
    """
    )

ESCAPE_POD.add_paths({
  '2' => THE_END_WINNER,
  '*' => THE_END_LOSER
  })

# Must be a way to implement a single room which pulls the description from the name of the previous room
CC_SHOOT_DEATH = Room.new("death", @@room_deaths['central_corridor_shoot'] + @@quips[rand(0..(@@quips.length - 1))])
CC_DODGE_DEATH = Room.new("death", @@room_deaths['central_corridor_dodge'] + @@quips[rand(0..(@@quips.length - 1))])
LWA_DEATH = Room.new("death", @@room_deaths['laser_weapon_armory'] + @@quips[rand(0..(@@quips.length - 1))])
TB_DEATH = Room.new("death", @@room_deaths['the_bridge'] + @@quips[rand(0..(@@quips.length - 1))])

#GENERIC_DEATH = Room.new('death',"you died")

THE_BRIDGE.add_paths({
  'throw the bomb' => TB_DEATH, # .enter('the_bridge'), #Death.enter(result.class.name),
  'slowly place the bomb' => ESCAPE_POD
  })

LASER_WEAPON_ARMORY.add_paths({
  '0132' => THE_BRIDGE,
  '*' => LWA_DEATH # DEATH.enter('laser_weapon_armory'),
  })

CENTRAL_CORRIDOR.add_paths({
  'shoot!' => CC_SHOOT_DEATH, # .enter('central_corridor_shoot'),
  'dodge!' => CC_DODGE_DEATH, # DEATH.enter('central_corridor_dodge'),
  'tell a joke' => LASER_WEAPON_ARMORY
  })

START = CENTRAL_CORRIDOR

# A whitelist of allowed room names. We use this so that
# bad people on the internet can't access random variables
# with names.  You can use Test::constants and Kernel.const_get
# too.
ROOM_NAMES = {
    'CENTRAL_CORRIDOR' => CENTRAL_CORRIDOR,
    'LASER_WEAPON_ARMORY' => LASER_WEAPON_ARMORY,
    'THE_BRIDGE' => THE_BRIDGE,
    'ESCAPE_POD' => ESCAPE_POD,
    'THE_END_WINNER' => THE_END_WINNER,
    'THE_END_LOSER' => THE_END_LOSER,
    'START' => START,
  }

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

def Map::load_room(session)
  # Given a session this will return the right room or nil
  return ROOM_NAMES[session[:room]]
end

def Map::save_room(session, room)
  # Store the room in the session for later, using its name
  session[:room] = ROOM_NAMES.key(room)
end

end

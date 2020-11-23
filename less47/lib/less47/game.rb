class Room

# Creates the room with a name and description
  def initialize(name, description)
    @name = name
    @description = description
    @paths = {}
  end

  #these make it easy for you to access the variables, variables above are stuck int he
  # method and cannot be easily accessed outside the class
  attr_reader :name
  attr_reader :paths
  attr_reader :description

# Cannot go anywhere until the paths hash has directions, this is the "Engine"
  def go(direction)
    return @paths[direction]
  end

# Adds new paths to the paths hash - needs to be created per room, it's not an
# overview map as such, each room has the paths from the rooms
  def add_paths(paths)
    @paths.update(paths)
  end

end

require "./less47/game.rb" # Loads the ruby files to be test, use one test file per file
require "test/unit"

class TestGame < Test::Unit::TestCase

# This tests that the name is properly done and the paths hash is created and is empty
  def test_room()
    gold = Room.new("GoldRoom",
    """This room has gold in it you can grab. There's a
  door to the north.""")
  assert_equal("GoldRoom", gold.name)
  assert_equal({}, gold.paths)
  end

# This tests if the pathing works, e.g. can go north or south from center
  def test_room_paths()
  center = Room.new("Center", "Test room in the center.")
  north = Room.new("North", "Test room in the north.")
  south = Room.new("South", "Test room in the south.")

  center.add_paths({'north'=> north, 'south'=> south})
  assert_equal(north, center.go('north'))
  assert_equal(south, center.go('south'))
  end

# This tests if the map works, e.g. can go forwards and backwards
  def test_map()
  start = Room.new("Start", "You can go west and down a hole.")
  west = Room.new("Trees", "There are trees here, you can go east.")
  down = Room.new("Dungeon", "It's dark down here, you can go up.")

  start.add_paths({'west'=> west, 'down'=> down})
  west.add_paths({'east'=> start})
  down.add_paths({'up'=> start})

  assert_equal(west, start.go('west'))
  # Note, the following start.go.go is actually testing going west, then east from west
  # i.e. it tests both going to the room and returning from the room
  assert_equal(start, start.go('west').go('east'))
  assert_equal(start, start.go('down').go('up'))
  end
end

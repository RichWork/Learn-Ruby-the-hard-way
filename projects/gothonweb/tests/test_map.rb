require "./gothonweb/map.rb" # Loads the ruby files to be test, use one test file per file
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


  def test_gothon_game_map()
       session[:previous_room] = 'START'
      # @@direction = 'shoot!'
        assert_equal(Map::DEATH, Map::START.go('shoot!'))
        assert_includes(Map::START.go('shoot!').description, "Quick on the")
        assert_includes(Map::START.go('dodge!').description, "Like a world")

        room = Map::START.go('tell a joke')
        assert_equal(Map::LASER_WEAPON_ARMORY, room)
        assert_includes(room.go('*').description, "The lock buzzes")
        #assert_equal(Map::GENERIC_DEATH, room.go('test'))

        room = room.go('0132')
        assert_equal(Map::THE_BRIDGE, room)
        #assert_equal(Map::DEATH, room.go('throw the bomb'))
        assert_includes(room.go('throw the bomb').description, "In a panic")

        room = room.go('slowly place the bomb')
        assert_equal(Map::ESCAPE_POD, room)
        assert_equal(Map::THE_END_LOSER, room.go('*'))
        assert_equal(Map::THE_END_WINNER, room.go('2'))
        # complete this test by making it play the game
  end

  def test_session_loading()
        session = {}

        room = Map::load_room(session)
        assert_equal(room, nil)

        Map::save_room(session, Map::START)
        room = Map::load_room(session)
        assert_equal(room, Map::START)

        room = room.go('tell a joke')
        assert_equal(room, Map::LASER_WEAPON_ARMORY)

        Map::save_room(session, room)
        assert_equal(room, Map::LASER_WEAPON_ARMORY)
  end

  def test_quip()
    quip = Map::load_quip
    assert_includes(quip, "you") # may fail due to You/you/your
  end
end

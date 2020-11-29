require "./gothonweb/map.rb" # Loads the ruby files to be test, use one test file per file
require "test/unit"

class TestGame < Test::Unit::TestCase


  def test_room()
    gold = Room.new("GoldRoom",
    """This room has gold in it you can grab. There's a
    door to the north.""")
    assert_equal("GoldRoom", gold.name)
    assert_equal({}, gold.paths)
  end


  def test_room_paths()
    center = Room.new("Center", "Test room in the center.")
    north = Room.new("North", "Test room in the north.")
    south = Room.new("South", "Test room in the south.")

    center.add_paths({'north'=> north, 'south'=> south})
    assert_equal(north, center.go('north'))
    assert_equal(south, center.go('south'))
  end


  def test_map()
    start = Room.new("Start", "You can go west and down a hole.")
    west = Room.new("Trees", "There are trees here, you can go east.")
    down = Room.new("Dungeon", "It's dark down here, you can go up.")

    start.add_paths({'west'=> west, 'down'=> down})
    west.add_paths({'east'=> start})
    down.add_paths({'up'=> start})

    assert_equal(west, start.go('west'))
    assert_equal(start, start.go('west').go('east'))
    assert_equal(start, start.go('down').go('up'))

  end


  def test_gothon_game_map()
    assert_equal(Map::CC_SHOOT_DEATH, Map::START.go('shoot!'))
    assert_includes(Map::START.go('shoot!').description, "Quick on the")
    assert_includes(Map::START.go('dodge!').description, "Like a world")

    room = Map::START.go('tell a joke')
    assert_equal(Map::LASER_WEAPON_ARMORY, room)
    assert_includes(room.go('*').description, "The lock buzzes")

    code = Map::take_LWA_code
    assert_equal(code.length, 3)

    room_LWA_lock = room.go("*")
    assert_equal(Map::LWA_CODE, room_LWA_lock)

    room = room.go(code)
    room_after_LWA_lock = room_LWA_lock.go(code)
    assert_equal(Map::THE_BRIDGE, room)
    assert_equal(room_after_LWA_lock, room)
    assert_includes(room.go('throw the bomb').description, "In a panic")

    room = room.go('slowly place the bomb')
    assert_equal(Map::ESCAPE_POD, room)
    assert_equal(Map::THE_END_LOSER, room.go('*'))
    assert_equal(Map::THE_END_WINNER, room.go('2'))

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
    assert(quip.downcase =~ /you./)
  end


  def test_take_LWA_code
    code = Map::take_LWA_code
    assert_equal(code.length, 3)
  end


  def test_scan_code
    code = Map::take_LWA_code
    guess_fail = "fail"
    assert_equal(Map::scan_code(code, guess_fail), "Red, Red, and Red")
    guess_correct = code
    assert_equal(Map::scan_code(code, guess_correct), "Green, Green, and Green")
  end

end

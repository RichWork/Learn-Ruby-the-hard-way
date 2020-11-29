require "./bin/app.rb"
require "./lib/gothonweb/map.rb"
require "test/unit"
require "rack/test"
# rack test allows testing of the web server by pretending to be a browser

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  # either defines the application being used or tests it
  def app
    Sinatra::Application
  end

# tests that the default page redirects towards '/game'
  def test_my_default
    get '/'
    follow_redirect!
    assert last_response.ok? # Tests if a positive redirect response received
    assert_equal "http://example.org/game", last_request.url
  end

  def test_game
    # session = {}
    # session[:room] = 'START'
    get '/'
    #follow_redirect!
    get '/game'
    assert last_response.ok? # Tests if a positive redirect response is received
    assert last_response.body.include?('The Gothons of Planet')
    assert last_response.body.include?('Central Corridor')

    #assert_equal(session[:guess], 0)
    #assert_equal(code.length, 3)
  end

  # def test_laser_weapon_armory_lock
  #   get '/'
  #   session[:room] = 'LWA_code'
  #   session[:guess] = 0
  #   follow_redirect!
  # end


  def test_game_post
    get '/'
    follow_redirect!
    post '/game', params={:action => 'shoot!'} # inputs parameters using "post"
    follow_redirect!
    assert last_response.ok? # Tests if a positive redirect response is received
    assert_equal "http://example.org/game", last_request.url
    assert last_response.body.include?('Quick on the') # checks to see if page switches after input
  end

end

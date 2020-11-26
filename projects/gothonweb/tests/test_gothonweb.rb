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

# tests that the default page returns the 'Hello world'
  def test_my_default
    get '/'
    follow_redirect!
    assert last_response.ok? # Not sure what this tests
    assert_equal "http://example.org/game", last_request.url
    #assert_redirected_to '/game'
  end

  def test_game
    get '/'
    follow_redirect!
    #get '/game'
    assert last_response.ok? # Not sure what this tests
    assert last_response.body.include?('The Gothons of Planet') # Tests to see if the text 'A Greeting' is there
    assert_equal session[:room], 'START'
  end

  def test_hello_form_post
    get '/'
    follow_redirect!
    post '/game', params={:action => 'shoot!'} # inputs parameters using "post"
    assert_equal "http://example.org/game", last_request.url
    #assert last_response.ok? # Still not sure
    assert last_response.body.include?('Quick on the') # checks to see if page switches after input
  end

end

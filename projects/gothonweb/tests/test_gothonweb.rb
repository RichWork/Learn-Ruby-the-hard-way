require "./bin/app.rb"
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
    assert_equal 'Hello world', last_response.body
  end

  def test_hello_form
    get '/hello/'
    assert last_response.ok? # Not sure what this tests
    assert last_response.body.include?('A Greeting') # Tests to see if the text 'A Greeting' is there
  end

  def test_hello_form_post
    post '/hello/', params={:name => 'Frank', :greeting => "Hi"} # inputs parameters using "post"
    assert last_response.ok? # Still not sure
    assert last_response.body.include?('I just wanted to say') # checks to see if page switches after input
  end

end

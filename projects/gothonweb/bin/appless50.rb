require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
  return 'Hello world'
end

get '/hello/' do
  # This line says either use "Hi There", OR (||) use what is in the params, which can be changed
  # from the address line with "?greeting=XXX"
  greeting = params[:greeting] || "Hi There"
  # The erb renders the index.erb file in the views folder
  # The :locals part also allows the greeting part to be modified from the address line
  erb :index, :locals => {'greeting' => greeting} # the greeting here links to the index file
end

# static files cannot be changed. the page is delivered as is.
get '/howdy.html' do
  greeting = params[:greeting] || "Hi There"
  static :howdy, :locals => {'greeting' => greeting} # the greeting here links to the howdy static file
end

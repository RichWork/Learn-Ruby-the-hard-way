require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
  return 'Hello world'
end

get '/hello/' do
  erb :hello_form
end

post '/hello/' do
# This line says either use "Hi There", OR (||) use what is in the params, which can be changed
# from the address line with "?greeting=XXX" or "?name=XXX"
# In this case though, these parameters are generated in the :hello_form, the "get" handler
# above runs first and the user inputs these values which are passed here by the "post" handler
  greeting = params[:greeting] || "Hi There"
  name = params[:name] || "Nobody"

# adding an upload image path, taken fromhttps://azemoh.com/2016/05/17/sinatra-managing-file-uploads/
  if params[:image] && params[:image][:filename] # checks if user uploaded an image
    filename = params[:image][:filename] # gives filename the name of the file
    file = params[:image][:tempfile] # gives file the file path
    path = "./data/#{filename}" # defines path to save in

# Writes file to disk
    File.open(path, 'wb') do |f|
      f.write(file.read)
    end
  end

  # The erb renders the index.erb file in the views folder
  # The :locals indicates that parameters are being passed to the "erb :index" call
  # specifically greeting and name, which have come from the form.
  erb :index, :locals => {'greeting' => greeting, 'name' => name}
  # erb :index then loads the index file with the parameters
end

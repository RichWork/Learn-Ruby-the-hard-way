require 'sinatra'
require './lib/gothonweb/map.rb'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"
enable :sessions
set :session_secret, 'BADSECRET'

get '/' do
  session[:room] = 'START'
  redirect to('/game')
end

get '/game' do
  room = Map::load_room(session)

  if room && room.name == 'death'
    quip = Map::load_quip
    erb :show_room, locals: {room: room, quip: quip}
  elsif room
    erb :show_room, locals: {room: room}
  else
    erb :you_died, locals: {room: room}
  end
end

post '/game' do
  room = Map::load_room(session)
  action = params[:action]
  #@@action = action

  if room
    next_room = room.go(action) || room.go("*") # Not sure if this * is code for all answers

    if next_room
      Map::save_room(session, next_room)
    end

    redirect to('/game')
  else
    erb :you_died
  end
end

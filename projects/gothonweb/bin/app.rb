require 'sinatra'
require './lib/gothonweb/map.rb'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"
enable :sessions
set :session_secret, 'BADSECRET'

get '/' do
  session.clear
  session[:room] = 'START'
#  code = Map::take_LWA_code
  session[:guess] = 0
  redirect to('/game')
end

get '/game' do
  room = Map::load_room(session)
  code = Map::take_LWA_code
  #@guess = 0
  if room && room.name.include?('Death')
    quip = Map::load_quip
    erb :show_room, locals: {room: room, quip: quip}
  elsif room && room.name == 'Laser Weapon Armory Lock'
    session[:guess] = session[:guess] + 1
    guess = 10 - session[:guess]
    previous_code_guess = session[:previous_action]
    light_display = Map::scan_code(code, previous_code_guess)
    erb :lwa_code, locals: {room: room, code: code, guess: guess,
      previous_code_guess: previous_code_guess, light_display: light_display}
  elsif room
    erb :show_room, locals: {room: room}
  else
    erb :you_died, locals: {room: room}
  end
end

post '/game' do
  room = Map::load_room(session)
  action = params[:action]

  if room && room.name == 'Laser Weapon Armory Lock' && session[:guess] == 9
    next_room = room.go('Death')

    if next_room
      Map::save_room(session, next_room)
    end

    redirect to('/game')
  elsif room
    next_room = room.go(action) || room.go("*") # Not sure if this * is code for all answers
    session[:previous_action] = action

    if next_room
      Map::save_room(session, next_room)
    end

    redirect to('/game')
  else
    erb :you_died
  end
end

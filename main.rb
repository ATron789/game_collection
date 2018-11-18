require 'sinatra'
require 'sinatra/reloader'
require 'slim'
require 'sass'
require 'sequel'
require './games'
require './test'

get('/styles.css'){ scss :styles }

get '/' do
  @title = "Game Collection"
  slim :home
end
get '/ps4' do
  @ps4 = Ps4.all
  slim :ps4
end
get '/ps4/:id' do
  @ps4_game = Ps4[params[:id]]
  slim :ps4_game
end
get '/about' do
  @title = "About this website"
  slim :about
end
get '/contact' do
  slim :contact
end

not_found do
  slim :not_found
end

require 'sinatra'
require 'sinatra/reloader'
require 'slim'
require 'sass'
require 'sequel'
require './ps4_routes'
require './ps4'
require './values_checker'



get('/styles.css'){ scss :styles }

get '/' do
  @title = "Game Collection"
  slim :home
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

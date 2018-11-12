require 'sinatra'
require 'sinatra/reloader'
require 'slim'
require 'sass'
require 'data_mapper'
require_relative 'ps4'

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

get '/ps4' do
  @ps4gs = Ps4Games.all
  slim :ps4
end

not_found do
  slim :not_found
end

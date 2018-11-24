require 'sinatra'
require 'sinatra/reloader'
require 'slim'
require 'sass'
require 'sequel'
require './ps4'

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
get '/ps4' do
  @ps4 = Ps4.all
  slim :ps4
end
get '/ps4/new' do
  @ps4_game = Ps4.new
  slim :ps4_new_edit
end
get '/ps4/:id' do
  @ps4_game = Ps4[params[:id]]
  slim :ps4_game
end

post '/ps4' do
  @new_ps4 = Ps4.new
  @new_ps4.set(params[:ps4])
  @new_ps4.save
  binding.pry
  redirect "/ps4/#{@new_ps4[:id]}"
end

get '/ps4/:id/edit' do
  @ps4_game = Ps4[params[:id]]
  slim :ps4_new_edit
end

put '/ps4/:id' do
  binding.pry
  @ps4_game = Ps4[params[:id]]
  @ps4_game.update(params[:ps4])
  redirect "/ps4/#{@ps4_game.id}"
end

delete '/ps4/:id' do
  Ps4[params[:id]].destroy
  redirect to('/ps4')
end

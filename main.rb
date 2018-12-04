require 'sinatra'
require 'sinatra/reloader'
require 'slim'
require 'sass'
require './game_routes'
require './games'
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

get '/new' do
  @game = Games.new
  slim :new_edit_game
end
#route handlers order is important... they got to stay in one file

not_found do
  slim :not_found
end
get '/:console' do
  @games = Games.where(console: params[:console])
  slim :games_list
end

get '/:console/:id' do
  @game = Games[params[:id]]
  slim :game_details
end

post '/new' do
  ValuesChecker.reset
  ValuesChecker.right_inputs(params[:game])
  unless ValuesChecker.class_variable_get(:@@inv_val).empty?
    redirect '/new'
  end
  @new_game = Games.create(params[:game])
  redirect "/#{@new_game.console}/#{@new_game[:id]}"
end

get '/:console/:id/edit' do
  @game = Games[params[:id]]
  slim :new_edit_game
end

put '/:console/:id' do
  @game = Games[params[:id]]
  @game.update(params[:game])
  redirect "/#{@game.console}/#{@game.id}"
end

delete '/:console/:id' do
  Games[params[:id]].destroy
  redirect to("/#{params[:console]}")
end

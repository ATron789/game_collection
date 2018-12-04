# get '/:console' do
#   @games = Games.where(console: params[:console])
#   slim :games_list
# end
#
# get '/:console/:id' do
#   @game = Games[params[:id]]
#   slim :game_details
# end
#
# post '/new' do
#   ValuesChecker.reset
#   ValuesChecker.right_inputs(params[:game])
#   unless ValuesChecker.class_variable_get(:@@inv_val).empty?
#     redirect '/new'
#   end
#   @new_game = Games.create(params[:game])
#   redirect "/#{@new_game.console}/#{@new_game[:id]}"
# end
#
# get '/:console/:id/edit' do
#   @game = Games[params[:id]]
#   slim :new_edit_game
# end
#
# put '/:console/:id' do
#   @game = Games[params[:id]]
#   @game.update(params[:game])
#   redirect "/#{@game.console}/#{@game.id}"
# end
#
# delete '/:console/:id' do
#   Games[params[:id]].destroy
#   redirect to("/#{params[:console]}")
# end

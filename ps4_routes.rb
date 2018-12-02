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
  ValuesChecker.reset
  ValuesChecker.right_inputs(params[:ps4])
  unless ValuesChecker.class_variable_get(:@@inv_val).empty?
    redirect '/ps4/new'
  end
  @new_ps4 = Ps4.new
  @new_ps4.set(params[:ps4])
  @new_ps4.save
  redirect "/ps4/#{@new_ps4[:id]}"
end

get '/ps4/:id/edit' do
  @ps4_game = Ps4[params[:id]]
  slim :ps4_new_edit
end

put '/ps4/:id' do
  @ps4_game = Ps4[params[:id]]
  @ps4_game.update(params[:ps4])
  redirect "/ps4/#{@ps4_game.id}"
end

delete '/ps4/:id' do
  Ps4[params[:id]].destroy
  redirect to('/ps4')
end

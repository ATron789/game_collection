require 'sequel'
DATABASE = Sequel.connect('sqlite://games.db')

class Ps4 < Sequel::Model(DATABASE[:ps4])
end
get '/ps4' do
  @ps4 = Ps4.all
  slim :ps4
end
get '/ps4/:id' do
  @ps4_game = Ps4[params[:id]]
  slim :ps4_game
end

require 'sequel'
require 'pry'
DATABASE = Sequel.connect('sqlite://games.db')

class Ps4 < Sequel::Model(DATABASE[:ps4])
  def release_date=(date)
    super Date.strptime(date, '%m/%d/%Y')
  end
end
get '/ps4' do
  @ps4 = Ps4.all
  slim :ps4
end
get '/ps4/new' do
  @ps4_game = Ps4.new
  slim :new_ps4
end
get '/ps4/:id' do
  @ps4_game = Ps4[params[:id]]
  slim :ps4_game
end

# post '/ps4' do
#   ps4_game = Ps4.create(params[:ps4_game])
#   binding.pry
#   redirect "/ps4/#{ps4_game.id}"
# end

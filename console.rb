require 'sequel'
require './games'

DATABASE = Sequel.connect('sqlite://games.db')

class Console < Sequel::Model(DATABASE[:consoles])
  many_to_many :games, left_key: :id, right_key: :game_id,
    join_table: :consolesgames

end

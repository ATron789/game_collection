require 'sequel'
DATABASE = Sequel.connect('sqlite://games.db')

class Ps4 < Sequel::Model(DATABASE[:ps4])
end

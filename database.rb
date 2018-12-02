require 'sequel'
#it knows configure because it is connected to
#main.rb via ps4.rb
DATABASE = Sequel.connect('sqlite://games.db')

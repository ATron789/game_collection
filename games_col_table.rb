require 'sequel'

class Games
  @@db = Sequel.connect('sqlite://games.db')
  # class << self
  #   attr_reader :db
  # end
#it returns nil

  def initialize
    begin
        @@db.create_table(:games) do
          primary_key :id
          String :title
          String :console
          String :info
          String :pic_link
          DateTime :release_date
        end
    rescue Sequel::DatabaseError
    end
  end
end

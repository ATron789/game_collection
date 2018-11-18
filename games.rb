require 'sequel'

class Games
  @@db = Sequel.connect('sqlite://games.db')
  # class << self
  #   attr_reader :db
  # end
#it returns nil

  def initialize
    begin
      [:ps4,:xbox360,:xbox].each do |x|
        @@db.create_table(x) do
          primary_key :id
          String :title
          String :info
          String :pic_link
          DateTime :release_date
        end
      end
    rescue Sequel::DatabaseError
    end
  end
  def self.ps4
    @@db[:ps4]
  end
end

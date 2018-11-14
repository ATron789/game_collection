require 'sequel'

class Games
  DB = Sequel.connect('sqlite://games.db')
  def initialize

    begin
      [:ps4,:xbox360,:xbox].each do |x|
        DB.create_table(x) do
          primary_key :id
          String :title
          String :info
          String :pic_link
        end
      end
    rescue Sequel::DatabaseError
    end
  end
end

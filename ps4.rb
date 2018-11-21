require 'sequel'
require 'pry'
DATABASE = Sequel.connect('sqlite://games.db')

class Ps4 < Sequel::Model(DATABASE[:ps4])
  def release_date=(date)
    super Date.strptime(date, '%d/%m/%Y')
  end
  def release_date_string
    self[:release_date].strftime("%e %B %Y")
  end
end

require 'data_mapper'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

class Ps4Games
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :info, Text
  property :release_on, Date
end

DataMapper.finalize

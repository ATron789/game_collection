require 'pry'
# require './database'
require 'sequel'
require 'nokogiri'
require 'open-uri'

DATABASE = Sequel.connect('sqlite://games.db')

class Games < Sequel::Model(DATABASE[:games])
  def release_date=(date)
    Date.strptime(date, "%e/%m/%Y")
    super
  end
  def release_date_string
    self[:release_date].strftime("%e %B %Y")
  end
  def release_date_string_num
    self[:release_date].strftime("%e/%m/%Y")
  end

  def before_create
    self.id ||= Games.last.id.next
  end
  def after_create
    info_wiki
    set_art_cover
  end
  def valid_date?
    self[:release_date] != nil
  end
  private
  def info_wiki
    url_wiki = "https://en.wikipedia.org/wiki/" + self.title.gsub(/ /, "_")
    parsed_wiki = Nokogiri::HTML.parse(open(url_wiki))
    game_info = parsed_wiki.css("div.mw-parser-output p")[1].text.gsub("\n", " ")
    self.update(info: game_info)
  end

  def set_art_cover
    self.update(pic_link: "#{self.title.downcase.split.join.gsub(/[\W\s]/, "")}.jpg")
  end
end

# wiki.css("div.mw-parser-output p")[1].text
# this is the parsing path for the first paragraph of wikipedia

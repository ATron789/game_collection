require 'pry'
require './database'
require 'nokogiri'
require 'open-uri'

class Ps4 < Sequel::Model(DATABASE[:ps4])
  def release_date=(date)
    super Date.strptime(date, "%e %B %Y")
  end
  def release_date_string
    self[:release_date].strftime("%e %B %Y")
  end
  def info_wiki
    url_wiki = "https://en.wikipedia.org/wiki/" + self.title.gsub(/ /, "_")
    parsed_wiki = Nokogiri::HTML.parse(open(url_wiki))
    game_info = parsed_wiki.css("div.mw-parser-output p")[1].text.gsub("/n", " ")
    self.update(info: game_info)
  end
  def before_create
    self.id ||= Ps4.last.id.next
  end
  def set_art_cover
    self.update(pic_link: "#{self.title.downcase.split.join}.jpg")
  end
end

# wiki.css("div.mw-parser-output p")[1].text
# this is the parsing path for the first paragraph of wikipedia

require 'pry'
require './database'
require 'nokogiri'
require 'open-uri'

class Ps4 < Sequel::Model(DATABASE[:ps4])
  def release_date=(date)
    begin
      Date.strptime(date, "%e/%m/%Y")
      super
    rescue
      self[:release_date] = "n/a"
    end
  end
  def release_date_string
    self[:release_date].strftime("%e %B %Y")
  end
  def release_date_string_num
    self[:release_date].strftime("%e/%m/%Y")
  end

  def before_create
    self.id ||= Ps4.last.id.next
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

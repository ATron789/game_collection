require './ps4'

describe Ps4 do
  let (:fo4) {Ps4[title: "Fallout 4"]}
  it 'shows the date' do
    expect(fo4.release_date_string).to eq "10 November 2015"
  end

  context 'new entry' do

    let (:batman) do
      batman = Ps4.new
      batman.set(title: "Batman: Arkham Knight")
      batman.save
    end
    after(:each) do
      Ps4.where(title: "Batman: Arkham Knight").destroy
    end

    it 'the next entry id is the next value of the last entry' do
      expect(batman.id).to eq fo4.id.next
    end
    it 'pic_link from wikipedia after creation' do
      expect(batman.pic_link).to eq "batmanarkhamknight.jpg"
    end
    it 'gets the info from wikipedia after creation' do
      url_wiki = "https://en.wikipedia.org/wiki/" + batman.title.gsub(/ /, "_")
      parsed_wiki = Nokogiri::HTML.parse(open(url_wiki))
      game_info = parsed_wiki.css("div.mw-parser-output p")[1].text.gsub("\n", " ")
      expect(batman.info).to eq game_info
    end
  end

end

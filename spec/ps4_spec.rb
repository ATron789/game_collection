require './ps4'

describe Ps4 do
  let (:fo4) {Ps4[title: "Fallout 4"]}
  it 'shows the date' do
    expect(fo4.release_date_string).to eq "10 November 2015"
  end
  context 'new entry' do
    let (:batman) {Ps4.create(title: "Batman")}
    after(:each) do
      Ps4.where(title: "Batman").destroy
    end
    it 'the next entry id is the next value of the last entry' do
      expect(batman.id).to eq fo4.id.next
    end
    it 'pic_link setter finds the cover in the folder' do
      fo4.set_art_cover
      binding.pry
      expect(fo4.pic_link).to eq "#{fo4.title.downcase.split.join}.jpg"
    end
  end

end

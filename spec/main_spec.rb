describe "Game Collection" do
  context '200' do
    it "should allow accessing the home page" do
      get '/' do
        expect(last_response).to be_ok
      end
    end
  end
end

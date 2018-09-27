describe 'connecting to Database' do
  context '#all' do
    it 'returns an array of bookmarks' do
      expect(Bookmarks.all).to be_an Array
    end
  end

  context '#check_url?' do
    it 'checks url starts http or https' do
      expect(Bookmarks.check_url?('http://www.pleasepass.com')).to eq 0
    end

    it 'throws error if url doesnt start with http or https' do
      expect(Bookmarks.check_url?('www.pleasefail.com')).to eq nil
    end
  end

end

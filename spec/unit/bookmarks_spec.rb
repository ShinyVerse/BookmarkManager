describe 'connecting to Database' do
  it 'shows certain bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES('www.etsy.com');")
    bookmarks = Bookmarks.all
    expect(bookmarks).to include('www.etsy.com')
  end
end

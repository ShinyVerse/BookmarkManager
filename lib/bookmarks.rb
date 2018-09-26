require 'pg'

class Bookmarks
  def self.all
    if ENV['BOOKMARKS'] == 'test'
      connection = PG.connect(dbname:'bookmark_manager_test')
    else
      connection = PG.connect(dbname:'bookmark_manager')
    end
    result = connection.exec('SELECT * FROM bookmarks')
    result.map {|bookmark| bookmark['url']}
  end

  def create(url)
    if ENV['BOOKMARKS'] == 'test'
      connection = PG.connect(dbname:'bookmark_manager_test')
    else
      connection = PG.connect(dbname:'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end
end

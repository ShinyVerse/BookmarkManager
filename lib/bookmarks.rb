require 'pg'
require 'uri'

class Bookmarks
  def self.all
    if ENV['BOOKMARKS'] == 'test'
      connection = PG.connect(dbname:'bookmark_manager_test')
    else
      connection = PG.connect(dbname:'bookmark_manager')
    end
    result = connection.exec('SELECT * FROM bookmarks')
    result.map {|bookmark| bookmark}
  end

  def self.check_url?(url)
      url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

  def self.create(url,title)
    if ENV['BOOKMARKS'] == 'test'
      connection = PG.connect(dbname:'bookmark_manager_test')
    else
      connection = PG.connect(dbname:'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')") if check_url?(url)
  end

  def self.delete_id(id)
    if ENV['BOOKMARKS'] == 'test'
      connection = PG.connect(dbname:'bookmark_manager_test')
    else
      connection = PG.connect(dbname:'bookmark_manager')
    end
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end
end

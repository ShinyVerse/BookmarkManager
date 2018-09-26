require 'sinatra/base'
require 'pg'
require_relative 'lib/bookmarks'

class BookmarkManager < Sinatra::Base
  get '/' do
    @bookmarks = Bookmarks.all
    erb :homepage
  end

  post '/save' do
    bookmark = Bookmarks.new
    bookmark.create(params['address'])
    puts 'saved bookmark?'
    puts bookmark.inspect
    puts 'now redirecting...'
    redirect('/')
  end
end

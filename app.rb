require 'sinatra/base'
require 'pg'
require_relative 'lib/bookmarks'
require 'sinatra/flash'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @bookmarks = Bookmarks.all
    erb :homepage
  end

  post '/save' do
    if params['address'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      bookmarks = Bookmarks.new
      bookmarks.create(params['address'])
    else
      flash[:error_message] = "Error: Unknown URL"
    end
    redirect('/')
  end
end

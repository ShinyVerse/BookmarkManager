require 'sinatra/base'
require 'pg'
require_relative 'lib/bookmarks'
require 'sinatra/flash'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions
  enable :method_override
  register Sinatra::Flash

  get '/' do
    @bookmarks = Bookmarks.all
    erb :homepage
  end

  post '/save' do
    if Bookmarks.check_url?(params['address'])
      Bookmarks.create(params['address'], params['title'])
    else
      flash[:error_message] = "Error: Unknown URL"
    end
    redirect('/')
  end

  delete '/delete/:id' do
    Bookmarks.delete_id(params[:id])
    redirect '/'
  end
end

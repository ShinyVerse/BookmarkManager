require 'sinatra/base'
# require_relative 'lib/selection'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

end

# require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "graduationpath"
  end
  use Rack::Flash

  get '/' do
      erb :index
  end

  helpers do
    def redirect_if_not_loged_in
      if !Helpers.is_logged_in?(session)
        redirect to '/login'
      end
    end

  end

end

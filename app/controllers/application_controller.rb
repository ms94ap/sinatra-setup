require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "pickaname"
  	end

  	get '/info' do
  		"We are live"
  	end
  end
require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true
    register Sinatra::Flash  
  end

  get "/" do
    redirect "/login" if not logged_in?
    @funds = current_user.funds.all
    erb :"/funds/index.html"
  end

  private

  def current_user 
    User.find_by_id(session[:id])
  end

  def logged_in?
    !!current_user
  end


  
end

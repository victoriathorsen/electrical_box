require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "electrical_box"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def user_saved
        
    end

    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id]) 
    end

    def current_submission
      @submission = Submission.find_by(id: params[:submission_id])
    end

    def require_user_login
      unless logged_in?
        redirect '/login'
      end
    end

    def flash_welcome
      flash[:welcome] = "Welcome, current_user"
    end

  end
end

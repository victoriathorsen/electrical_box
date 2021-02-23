class SessionsController < ApplicationController
    

    # users log in
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        # binding.pry
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/submissions'
        elsif   
            params[:username] == "" || params[:password] == ""
            @error = "No fields can be left blank"
            erb :'users/login' 
        else
            @error= "Username or password is invalid"
            erb :'users/login'
        end
    end

   

    # post '/login' do
    #     if params[:username].present? || params[:password_digest].present?
    #         @error = "No fields can be left blank"
    #         erb :'users/login' 
    #     else
    #         if user = User.find_by(username: params['username'], password: params['password_digest'])
    #             session[:user_id] =user.id
    #             redirect '/submissions'
    #         else 
    #             @error= "Username or password is invalid"
    #             erb :'users/login'
    #         end
    #     end
    # end

    # users find profile 

    get '/profile' do
        @user = User.find_by(id: session[:user_id])
        erb :'users/profile'
    end

    # users log out

    get '/logout' do
        session.clear
        redirect '/'
    end
end

class SessionsController < ApplicationController
    

    # users log in
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        if params["username"].empty? || params["password"].empty?
            @error = "No fields can be left blank"
            erb :'users/login' 
        else
            if user = User.find_by(username: params["username"], password: params["password"])
                session[:user_id] =user.id
                redirect '/submissions'
            else 
                @error= "Username or password is invalid"
                erb :'users/login'
            end
        end
    end
    # users log out

    get '/logout' do
        session.clear
        redirect '/'
    end
end

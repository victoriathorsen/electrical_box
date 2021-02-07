class UsersController < ApplicationController
    # users can sign up
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        # unique usernames
        # must be an email
        # long enough password
        # no blank info 
        user = User.new(params)
        user.save
        session[:user_id] = user.id
        redirect '/submissions'
    end

    # users can delete account

    delete '/user/:id' do
        user = User.find(params[:id])
        user.destroy
        redirect '/submissions'
    end

end
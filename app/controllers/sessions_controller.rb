class SessionsController < ApplicationController

    require 'pry'

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Your info doesn't match our database, please try again"
            redirect_to "/login"
        end
    end

    def omniauth
        binding.pry
    end 

    def destroy
        session.clear
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
    
end

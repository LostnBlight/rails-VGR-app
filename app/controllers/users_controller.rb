class UsersController < ApplicationController
    require 'pry'

    def show 
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
    end

    def new
        @user = User.new
        binding.pry
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:successful] = "Welcome #{@user.username} to Video Game Reviews"
            session[:user_id] = @user.id
            redirect_to games_path
        else
            render :new
        end
    end

    def update
        @user = User.find_by_id(session[:user_id])
        redirect_to '/' if !@user
    end
    
    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end

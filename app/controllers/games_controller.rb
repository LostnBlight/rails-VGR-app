class GamesController < ApplicationController
    require 'pry'
    def display
        @user = User.find(params[:id])
        if @user.id = session[:user_id]
        @games = @user.reviewed_games    
        else
            redirect_to(home_path)     
        end
    end

    def index
       @games = Game.all.order(:name)
    end

    def show 
        @game = Game.find_by_id(params[:id])
    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.new(game_params)
        if @game.save
            redirect_to  games_path
        else
            render :new
        end
    end
    
    def edit
    end

    def update
        find_game
            if find_game.update(game_params)
                redirect_to games_path
            else    
                render :edit  
            end
    end

    def destroy
        if find_game.destroy
            redirect_to games_path
        end 
    end

    private

    def game_params
        params.require(:game).permit(:name)
    end
    
end

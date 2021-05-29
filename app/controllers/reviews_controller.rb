class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:game_id] && @game = Game.find_by_id(params[:game_id])
            @reviews = @game.reviews
        else
            @reviews = Review.all
        end
    end

    def show
    end

    def new
        if params[:game_id] && @game = Game.find_by_id(params[:game_id]) && !current_user
            @review = @game.reviews.build
        else
            @review = Review.new
        end
    end

    def create
    end
    
    def edit
    end

    def update
    end

    def destroy
    end

    private

    
    
end


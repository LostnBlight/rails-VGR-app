class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    require 'pry'

    def show
        find_review
        @game = @review.game
    end

    def new
        @game = Game.find_by_id(params[:game_id])
        @review = @game.reviews.new
    end

    def create
        find_game
            @review = find_game.reviews.new(review_params)
            @review.user = current_user
            if @review.save
            redirect_to game_path(@review.game)
            else
                render :new 
            end
    end
    
    def edit
        find_review
        @game = @review.game
    end

    def update
        find_review
        if @review.update(review_params)
            redirect_to game_path(@review.game)
        else    
            render :edit   
        end
    end

    def destroy
        find_review
            if find_review.destroy
                redirect_to '/'
            end 
    end

    private

    def find_game
        @game = Game.find(params[:game_id])
    end

    def find_review
        @review = Review.find(params[:id])
    end 

    def review_params
        params.require(:review).permit(:content, :user_id, :game_id)
    end

    
    
end


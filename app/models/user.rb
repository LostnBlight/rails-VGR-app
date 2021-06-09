class User < ApplicationRecord
    has_many :reviews
    #has_many :games
    #has_many :games, through: :reviews
    has_many :reviewed_games, through: :reviews, source: :game

    has_secure_password
end

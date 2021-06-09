class Game < ApplicationRecord
    has_many :review_users, through: :reviews , source: :users 
    has_many :reviews
    #has_many :users, through: :reviews
end

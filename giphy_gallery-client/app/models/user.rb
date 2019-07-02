class User < ApplicationRecord
    has_many :comments
    has_many :gifs, through: :comments
end

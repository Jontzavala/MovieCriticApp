class Critic < ApplicationRecord
    has_many :movies
    has_many :reviews, dependent: :destroy
    has_many :reviewed_movies, through: :reviews, source: :movie
    has_secure_password

    validates :username, :email, presence: true, uniqueness: true
end

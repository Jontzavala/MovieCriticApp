class Movie < ApplicationRecord
  belongs_to :critic
  has_many :reviews
  has_many :critics, through: :reviews
end

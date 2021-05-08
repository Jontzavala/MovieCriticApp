class Movie < ApplicationRecord
  belongs_to :critic
  has_many :reviews, dependent: :destroy
  has_many :critics, through: :reviews
  has_many :image_elements

  validates :title, :description, presence: true
  validates_uniqueness_of :title

  scope :alpha, -> {order(:title) }
end

class Review < ApplicationRecord
  belongs_to :critic
  belongs_to :movie
  has_one_attached :image

  validates :content, presence: true

end

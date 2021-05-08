class ImageElement < ApplicationRecord
  belongs_to :movie
  has_one_attached :image
end

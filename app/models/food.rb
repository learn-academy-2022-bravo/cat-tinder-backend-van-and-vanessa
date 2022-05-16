class Food < ApplicationRecord
validates :genre, :category, :image, presence: true
validates :dishname, presence: true, length: { minimum: 3 }
end

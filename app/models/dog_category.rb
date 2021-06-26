class DogCategory < ApplicationRecord
  has_many :dogs, dependent: :destroy
  
  validates :category, presence: true
end

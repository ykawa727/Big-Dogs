class DogCategory < ApplicationRecord
  has_many :dogs, dependent: :destroy
end

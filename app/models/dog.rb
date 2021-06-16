class Dog < ApplicationRecord
   belongs_to :dog_owner
   belongs_to :dog_category
end

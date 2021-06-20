class Answer < ApplicationRecord
  belongs_to :dog_owner
  belongs_to :post
  has_many :references, dependent: :destroy
  
  def referenced_by?(dog_owner)
    references.where(dog_owner_id: dog_owner.id).exists?
  end
end

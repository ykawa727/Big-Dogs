class Answer < ApplicationRecord
  belongs_to :dog_owner
  belongs_to :post
  has_many :references, dependent: :destroy
  
  #「参考になった！」を押した飼い主（ユーザー）の存在を確認するメソッドを定義
  def referenced_by?(dog_owner)
    references.where(dog_owner_id: dog_owner.id).exists?
  end
end

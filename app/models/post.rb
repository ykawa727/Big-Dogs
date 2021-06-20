class Post < ApplicationRecord
  belongs_to :dog_owner
  belongs_to :dog
  has_many :answers, dependent: :destroy
  has_many :cognitions, dependent: :destroy

  #「知りたい」を押した飼い主（ユーザー）の存在を確認するメソッドを定義
  def cognitioned_by?(dog_owner)
   cognitions.where(dog_owner_id: dog_owner.id).exists?
  end

  attachment :image

  enum category: {"病気・ケガ": 0, "ご飯": 1, "飼い方・しつけ": 2, "お出かけ・遊び": 3, "介護": 4, "その他": 5}
end

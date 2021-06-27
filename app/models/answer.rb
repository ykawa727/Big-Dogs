class Answer < ApplicationRecord
  belongs_to :dog_owner
  belongs_to :post
  has_many :answer_favorites, dependent: :destroy

  validates :body, presence: true
  validates :body, length: { maximum: 300}

  #「参考になった！」を押した飼い主（ユーザー）の存在を確認するメソッドを定義
  def answer_favorited_by?(dog_owner)
    answer_favorites.where(dog_owner_id: dog_owner.id).exists?
  end
end

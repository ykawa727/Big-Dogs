class Post < ApplicationRecord
  belongs_to :dog_owner
  belongs_to :dog
  has_many :answers, dependent: :destroy
  has_many :cognitions, dependent: :destroy

  validates :dog_id, presence: true
  validates :category, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 500}

  #「知りたい」を押した飼い主（ユーザー）の存在を確認するメソッドを定義
  def cognitioned_by?(dog_owner)
   cognitions.where(dog_owner_id: dog_owner.id).exists?
  end

  enum category: {"病気・ケガ": 0, "ご飯": 1, "飼い方・しつけ": 2, "お出かけ・遊び": 3, "介護": 4, "その他": 5}

  #top画面のお悩み検索機能のメソッドを定義
  def self.search(category, word)
    if !word.present?
      where(["category like?", "%#{category}%"])
    elsif !category.present?
      where(["title like? OR body like? OR keyword like?", "%#{word}%", "%#{word}%", "%#{word}%"])
    else
      where(["category like? AND title like? OR body like? OR keyword like?", "%#{category}%", "%#{word}%", "%#{word}%", "%#{word}%"])
    end
  end

  #top画面のワンちゃんから検索機能のメソッドを定義
  def self.dog_search(dog_category_id, age, gender)
    result = self.joins(:dog)
    if dog_category_id.present?
      result = result.where(dogs:{dog_category_id: dog_category_id})
    end

    if age.present?
      result = result.where(dogs:{age: age})
    end

    if gender.present?
      result = result.where(dogs:{gender: gender})
    end
    return result
  end

  attachment :image

end

class Post < ApplicationRecord
  belongs_to :dog_owner
  belongs_to :dog
  has_many :answers, dependent: :destroy
  has_many :cognitions, dependent: :destroy

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

  def self.dog_search(dog_category_id, age, gender)
    # 検索の選択肢が一つも選ばれない場合は空をreturnする
    if dog_category_id.empty? && age.empty? && gender.empty?
      # []空の配列(複数個前提のデエタ)
      return []
    end
    # return用変数resultにdogをjoinしたpostを設定
    result = self.joins(:dog)
    # dog_category_idが存在する場合はdog_category_idで検索する
    if dog_category_id.present?
      result = result.where(dogs:{dog_category_id: dog_category_id})
    end
    # ageが存在する場合はageで検索する
    if age.present?
      # dog_category_idの有無に関わらずresultをageで検索する
      result = result.where(dogs:{age: age})
    end
    # genderが存在する場合はgenderで検索する
    if gender.present?
      # dog_category_id,ageの有無に関わらずresultをgenderで検索する
      result = result.where(dogs:{gender: gender})
    end
    # 検索されたresultをreturnする
    return result

  end


  def hello
    puts "hello"
  end

  def self.hello
    puts "hello"
  end

  attachment :image

end

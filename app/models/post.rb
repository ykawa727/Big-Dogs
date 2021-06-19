class Post < ApplicationRecord
  belongs_to :dog_owner
  belongs_to :dog
  
  attachment :image
  
  enum category: {"病気・ケガ": 0, "ご飯": 1, "飼い方・しつけ": 2, "お出かけ・遊び": 3, "介護": 4, "その他": 5}
end

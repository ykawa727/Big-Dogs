class Dog < ApplicationRecord
   belongs_to :dog_owner
   belongs_to :dog_category

   attachment :image

   enum age: {"０〜１歳（子犬）": 0, "１〜７歳（成犬）": 1, "７〜１０歳（シニア初期）": 2, "１０〜１３歳（シニア中期）": 3, "１３歳以上（シニア後期）": 4}
   enum gender: {"男の子": 0, "女の子": 1, "秘密": 2}
end

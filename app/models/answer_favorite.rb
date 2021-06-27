class AnswerFavorite < ApplicationRecord
  belongs_to :dog_owner
  belongs_to :answer
end

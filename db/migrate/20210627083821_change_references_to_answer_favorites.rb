class ChangeReferencesToAnswerFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_table :references, :answer_favorites
  end
end

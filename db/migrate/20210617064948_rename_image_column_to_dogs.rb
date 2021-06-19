class RenameImageColumnToDogs < ActiveRecord::Migration[5.2]
  def change
    rename_column :dogs, :image, :image_id
  end
end

class AddImageIdToDogOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :dog_owners, :image_id, :string
  end
end

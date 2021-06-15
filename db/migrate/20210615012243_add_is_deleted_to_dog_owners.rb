class AddIsDeletedToDogOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :dog_owners, :is_deleted, :boolean, default: false, null: false
  end
end

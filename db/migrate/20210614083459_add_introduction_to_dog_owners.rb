class AddIntroductionToDogOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :dog_owners, :introduction, :text
  end
end

class CreateDogCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_categories do |t|
      t.integer :size
      t.string :category

      t.timestamps
    end
  end
end

class CreateDogCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_categories do |t|

      t.timestamps
    end
  end
end

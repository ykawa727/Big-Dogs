class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.integer :dog_owner_id
      t.integer :dog_category_id
      t.string :name
      t.integer :age
      t.integer :gender
      t.text :introduction
      t.string :image

      t.timestamps
    end
  end
end

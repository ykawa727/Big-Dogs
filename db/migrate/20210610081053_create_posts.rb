class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :dog_owner_id
      t.integer :dog_id
      t.integer :category
      t.string :title
      t.text :body
      t.string :image_id
      t.string :keyword

      t.timestamps
    end
  end
end

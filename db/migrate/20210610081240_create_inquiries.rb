class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.integer :administrator_id
      t.integer :dog_owner_id
      t.string :name
      t.string :email
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end

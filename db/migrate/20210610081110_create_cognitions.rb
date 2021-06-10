class CreateCognitions < ActiveRecord::Migration[5.2]
  def change
    create_table :cognitions do |t|
      t.integer :post_id
      t.integer :dog_owner_id

      t.timestamps
    end
  end
end

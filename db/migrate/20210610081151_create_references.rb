class CreateReferences < ActiveRecord::Migration[5.2]
  def change
    create_table :references do |t|
      t.integer :answer_id
      t.integer :dog_owner_id

      t.timestamps
    end
  end
end

class CreateMedications < ActiveRecord::Migration[5.1]
  def change
    create_table :medications do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :medications, :users
    add_index :medications, :user_id
  end
end

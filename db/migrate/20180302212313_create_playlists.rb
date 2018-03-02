class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.integer :user_id, null: false
      t.string :name

      t.timestamps
    end

    add_foreign_key :playlists, :users
    add_index :playlists, :user_id
  end
end

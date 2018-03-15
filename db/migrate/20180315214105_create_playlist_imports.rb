class CreatePlaylistImports < ActiveRecord::Migration[5.1]
  def change
    create_table :playlist_imports do |t|
      t.integer :user_id, null: false
      t.string :state, null: false
      t.text :data

      t.timestamps
    end

    add_foreign_key :playlist_imports, :users
  end
end

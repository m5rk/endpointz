class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.integer :playlist_import_id, null: false
      t.integer :line_number, null: false
      t.json :data, null: false
      t.integer :song_id

      t.timestamps
    end

    add_foreign_key :lines, :songs
    add_foreign_key :lines, :playlist_imports
  end
end

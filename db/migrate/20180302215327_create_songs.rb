class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name

      t.timestamps
    end

    create_table :playlist_songs do |t|
      t.integer :playlist_id
      t.integer :song_id
    end

    add_foreign_key :playlist_songs, :playlists
    add_foreign_key :playlist_songs, :songs

    add_index :playlist_songs, :playlist_id
    add_index :playlist_songs, :song_id
  end
end

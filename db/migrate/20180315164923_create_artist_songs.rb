class CreateArtistSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :artist_songs do |t|
      t.integer :artist_id, null: false
      t.integer :song_id, null: false

      t.timestamps
    end

    add_foreign_key :artist_songs, :artists
    add_foreign_key :artist_songs, :songs

    add_index :artist_songs, :artist_id
    add_index :artist_songs, :song_id
  end
end

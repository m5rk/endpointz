require 'rails_helper'

RSpec.describe PlaylistImport, type: :model do
  let(:user) { create :user }

  describe 'creating' do
    context 'when a line references a song that does not exist' do
      before do
        artist = create :artist, name: 'Bon Jovi'
        song = create :song, name: "Livin' On a Prayer"
        song.artists << artist

        song = create :song, name: "Keep the Faith"
        song.artists << artist
      end
      let(:import) do
        <<~PLAYLIST
song_name,song_artist
Livin' On a Hair,Bon Jovi
Keep the Faith,Bon Jovi
        PLAYLIST
      end
      let(:action) { user.playlist_imports.create!(data: import, state: :uploaded) }

      it 'creates a PlaylistImport for the user' do
        expect { action }.to change { user.playlist_imports.count }.by(1)
      end

      it 'creates an unmatched line for unmatched line in the import' do
        action

        playlist_import = user.playlist_imports.first!

        expect(playlist_import.lines.where(song: nil).count).to eq(1)
      end

      it 'creates an matched line for matched line in the import' do
        action

        playlist_import = user.playlist_imports.first!

        expect(playlist_import.lines.where.not(song: nil).count).to eq(1)
      end
    end
  end
end

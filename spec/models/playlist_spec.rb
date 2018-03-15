require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it { is_expected.to belong_to(:user) }

  describe '#import' do
    context 'when there is an import' do
      let(:import) do
        <<~PLAYLIST
song_name,song_artist
Livin' On a Prayer,Bon Jovi
Keep the Faith,Bon Jovi
        PLAYLIST
      end
      let(:user) { create :user }
      let(:action) { Playlist.import(user, import) }

      before do
        artist = create :artist, name: 'Bon Jovi'
        song = create :song, name: "Livin' On a Prayer"
        song.artists << artist

        song = create :song, name: "Keep the Faith"
        song.artists << artist
      end

      it 'adds the songs to the playlist' do
        expect { action }.to change { user.playlists.count }.by(1)
      end
    end
  end
end

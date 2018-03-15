require 'rails_helper'

RSpec.describe Song, type: :model do
  describe '#songs' do
    context 'when there is a song with multiple artists' do
      let(:artist1) { create :artist, name: 'Madonna' }
      let(:artist2) { create :artist, name: 'Bon Jonvi' }

      let(:song) { create :song, name: 'When I am blue' }

      before do
        song.artists << artist1
        song.artists << artist2
      end

      it 'lists the artists for the song' do
        expect(song.artists).to have(2).artists
      end
    end
  end
end

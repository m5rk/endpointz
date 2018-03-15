class PlaylistImport < ApplicationRecord
  belongs_to :user
  has_many :lines

  after_create :delay_processing

  state_machine :state, initial: :uploaded do
    event :process do
      transition uploaded: :processing
    end

    event :complete do
      transition processing: :processed
    end

    after_transition to: :processing, do: [:initiate_processing]
    after_transition to: :processed, do: [:create_playlist]

    state :uploaded
    state :processing
    state :processed
  end

  def initiate_processing
    require 'csv'

    CSV.parse(data, headers: true).each_with_index do |row, index|
      song = Song.where(name: row['song_name']).first

      lines.create!(line_number: index + 1, data: row, song: song)
    end

    complete!
  end

  def create_playlist
  end

  def self.process(id)
    PlaylistImport.find(id).process!
  end

private
  def delay_processing
    PlaylistImport.process(id)
  end
end

class Line < ApplicationRecord
  belongs_to :playlist_import
  belongs_to :song, optional: true
end

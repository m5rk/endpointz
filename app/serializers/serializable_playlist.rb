class SerializablePlaylist < JSONAPI::Serializable::Resource
  type :playlist

  attributes :name

  has_many :songs
end

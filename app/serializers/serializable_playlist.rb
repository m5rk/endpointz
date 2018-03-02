class SerializablePlaylist < JSONAPI::Serializable::Resource
  type :playlist

  attributes :name
end

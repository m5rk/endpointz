class SerializableSong < JSONAPI::Serializable::Resource
  type :song

  attributes :name
end

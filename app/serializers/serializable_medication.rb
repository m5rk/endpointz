class SerializableMedication < JSONAPI::Serializable::Resource
  type :medication

  attributes :name
end

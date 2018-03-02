FactoryBot.define do
  factory :playlist do
    user

    name { "Playlist #{SecureRandom.hex(4)}" }
  end
end

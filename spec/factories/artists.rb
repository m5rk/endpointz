FactoryBot.define do
  factory :artist do
    name { "Artist #{SecureRandom.hex(4)}" }
  end
end

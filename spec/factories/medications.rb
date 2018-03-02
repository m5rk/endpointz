FactoryBot.define do
  factory :medication do
    user

    name { "Medication #{SecureRandom.hex(4)}" }
  end
end

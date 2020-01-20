FactoryBot.define do
  factory :property do
    name { Faker::Name.unique.name }
    address { Faker::Address.full_address }
    description { Faker::Lorem.paragraph(sentence_count: 30) }
    price { (200000 + rand(1000000)) }
    latt { Faker::Address.latitude }
    long { Faker::Address.longitude }
    association :category
  end
end

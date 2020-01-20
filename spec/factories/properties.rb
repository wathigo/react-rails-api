# frozen_string_literal: true

FactoryBot.define do
  factory :property do
    name { Faker::Name.unique.name }
    address { Faker::Address.full_address }
    description { Faker::Lorem.paragraph(sentence_count: 30) }
    price { rand(200_000..1_199_999) }
    latt { Faker::Address.latitude }
    long { Faker::Address.longitude }
    association :category
  end
end

FactoryBot.define do
  factory :favourite do
    association :property
    association :user
  end
end

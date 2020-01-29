# frozen_string_literal: true

FactoryBot.define do
  factory :favourite do
    association :property
    association :user
  end
end

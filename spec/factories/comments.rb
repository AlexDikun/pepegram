# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :account
    association :post
    message { FFaker::Lorem.sentence }
  end
end

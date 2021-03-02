# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    association :post
    association :account
  end
end

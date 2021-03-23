# frozen_string_literal: true

FactoryBot.define do
  factory :follow do
    association :follower, class_name: 'Account', foreign_key: 'follower_id'
    association :following, class_name: 'Account', foreign_key: 'following_id'
  end
end

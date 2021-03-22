# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    username { FFaker::Name.name }
    email { FFaker::Internet.email }
    bio { FFaker::Job.title }
    password { 'password1' }
    password_confirmation { 'password1' }
  end
end

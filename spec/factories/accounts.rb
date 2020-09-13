FactoryBot.define do
  factory :account do
    username { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end
end

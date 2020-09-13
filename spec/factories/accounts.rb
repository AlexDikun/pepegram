FactoryBot.define do
  factory :account do
    username { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { "password1" }
    password_confirmation { "password1" }
  end
end

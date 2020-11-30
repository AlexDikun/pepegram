# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :account

    title { FFaker::Book.title }
    message { FFaker::Lorem.sentence }
    # true image
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/pixel.png')) }
    # false image
    trait(:with_invalid_image) do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/pixel.txt')) }
    end
  end
end

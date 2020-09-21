# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :account

    title { FFaker::Book.title }
    message { FFaker::Loren.sentence }
    # true image
    image { Rack::Test::UploadedFile.new(Rails.root.join('image_name.png')) }
    # false image
    trait(:with_invalid_image) do
      image { Rack::Test::UploadedFile.new(Rails.root.join('image_name.txt')) }
    end
  end
end

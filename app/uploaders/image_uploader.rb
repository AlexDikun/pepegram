# app/uploaders/image_uploader.rb
# frozen_string_literal: true

# top-level class documentation comment

class ImageUploader < Shrine
  plugin :default_url
  plugin :validation_helpers
  plugin :derivatives

  Attacher.default_url do |**options|
    '/placeholders/frogg.jpeg'
  end

  Attacher.validate do
    validate_extension %w[jpg jpeg gif png svg webp]
  end
end

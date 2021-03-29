# app/uploaders/image_uploader.rb
# frozen_string_literal: true

require 'image_processing/mini_magick'

# top-level class documentation comment
class ImageUploader < Shrine
  plugin :default_url
  plugin :validation_helpers
  plugin :derivatives

  Attacher.validate do
    validate_extension %w[jpg jpeg png webp]
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
    {
      ava: magick.resize_to_limit!(100, 100),
      medium: magick.resize_to_limit!(500, 500)
    }
  end
end

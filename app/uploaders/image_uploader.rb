# app/uploaders/image_uploader.rb
# frozen_string_literal: true

# top-level class documentation comment

require "image_processing/mini_magick"

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
      medium: magick.resize_to_limit!(500, 500),
    }
  end
end

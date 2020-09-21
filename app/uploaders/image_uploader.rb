# app/uploaders/image_uploader.rb
# frozen_string_literal: true

# top-level class documentation comment
class ImageUploader < Shrine
  plugin :default_url

  Attacher.default_url do |**options|
    '/placeholders/frogg.jpeg'
  end
end

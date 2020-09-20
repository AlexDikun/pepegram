# app/uploaders/image_uploader.rb

class ImageUploader < Shrine
  plugin :default_url

  Attacher.default_url do |**options|
    '/placeholders/frogg.jpeg'
  end
end

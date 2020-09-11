class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)

  validates :title, presence: true, length:{ maximum: 100 }
  validates :message, presence: true

  belongs_to :account
end

# app/models/post.rb
# frozen_string_literal: true

# class describing the post model
class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)

  validates :title, presence: true, length: { maximum: 100 }
  validates :message, presence: true

  belongs_to :account
end

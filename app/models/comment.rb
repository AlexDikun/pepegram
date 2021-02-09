# app/models/comment.rb
# frozen_string_literal: true

# class describing the comment model
class Comment < ApplicationRecord
  belongs_to :account
  belongs_to :post
end

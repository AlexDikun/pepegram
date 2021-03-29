# app/models/like.rb
# frozen_string_literal: true

# class describing the like model
class Like < ApplicationRecord
  belongs_to :post
  belongs_to :account

  validates :account_id, presence: true
  validates :post_id, presence: true
end

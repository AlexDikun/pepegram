# spec/models/account.rb
# frozen_string_literal: true

# class describing the account model
class Account < ApplicationRecord
  devise :database_authenticatable, :registerable

  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_FORMAT = /\A(?=.*[a-z])(?=.*[\d]).{8,}\z/i

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT, message: 'Invalid email!' }
  validates :username, presence: true, length: { maximum: 30 }
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validates :password, format: { with: PASSWORD_FORMAT,
                                 message: 'Invalid password!' }, on: :create

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :follower_follows, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_follows, source: :follower

  has_many :following_follows, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followings, through: :following_follows, source: :following
end

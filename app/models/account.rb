class Account < ApplicationRecord
  EMAIL_FORMAT = /\A[^@\s]+@[^@\s]+\z/

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT, message: "Invalid email!"}
  validates :username, presence: true, length:{ maximum: 30 }

  has_many :posts

  devise :database_authenticatable, :registerable
end

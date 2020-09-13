class Account < ApplicationRecord
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_FORMAT = /\A(?=.*[a-z])(?=.*[\d]).{8,}\z/i
  
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT, message: "Invalid email!"}
  validates :username, presence: true, length: { maximum: 30 }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password, format: { with: PASSWORD_FORMAT,
                                 message: "Invalid password!"}

  has_many :posts

  devise :database_authenticatable, :registerable
end

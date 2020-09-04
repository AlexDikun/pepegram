class Account < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :posts
  
  devise :database_authenticatable, :registerable
end

class Follow < ApplicationRecord
  belongs_to :follower, class_name: "Account", foreign_key: "follower_id"
  belongs_to :following, class_name: "Account", foreign_key: "following_id"
end

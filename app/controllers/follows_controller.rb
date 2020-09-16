class FollowsController < ApplicationController
  before_action :authenticate_account!

  def create
    follower_acc = current_account
    following_acc = Account.find(params[:following_id])

    Follow.create(follower: follower_acc, following: following_acc)
    redirect_to account_followers_path(current_account) #FIXME!
  end
end

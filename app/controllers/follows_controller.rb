# app/controllers/follows_controller.rb
# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :authenticate_account!

  def create
    follower_acc = current_account
    following_acc = Account.find(params[:following_id])

    Follow.create(follower: follower_acc, following: following_acc)
    redirect_to account_posts_path(following_acc),
      flash: {success: 'You have successfully subscribed'}
  end

  def destroy
    @follow = Follow.find(params[:id])
    # @follow = Follow.where('account_id = ? AND follows = ?',
    #                        current_account.id, params[:account_id])
    @follow.destroy
    redirect_to account_path(current_account),
      flash: {success: 'You have successfully unfollow'}
  end

end

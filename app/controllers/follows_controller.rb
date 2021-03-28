# app/controllers/follows_controller.rb
# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :authenticate_account!

  def create
    @following_acc = Account.find(params[:following_id])

    Follow.create(follower: current_account, following: @following_acc)
    redirect_to account_path(@following_acc), flash: { success: 'You have successfully subscribed' }
  end

  def destroy
    following_acc = Account.find(params[:following_id])

    @follow = Follow.find_by(follower_id: current_account.id,
                             following_id: following_acc.id)
    @follow.destroy
    redirect_to account_path(current_account), flash: { success: 'You have successfully unfollow' }
  end
end

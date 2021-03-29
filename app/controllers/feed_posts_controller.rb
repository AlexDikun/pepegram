# app/controllers/feed_posts_controller.rb
# frozen_string_literal: true

# class describing the feed posts controller
class FeedPostsController < ApplicationController
  before_action :authenticate_account!

  def index
    @acc = current_account
    @posts = if current_account.followings.exists?
               Post.where(account_id: current_account.followings.pluck(:id)).order(created_at: :desc)
             else
               Post.none
             end

    render 'posts/index'
  end
end

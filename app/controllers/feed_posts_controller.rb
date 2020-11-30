class FeedPostsController < ApplicationController
  before_action :authenticate_account!

  def index
    if current_account.followings.exists?
      @acc = current_account
      @posts = Post.where(account_id: current_account.followings.pluck(:id)).order(created_at: :desc)
    else
      Post.none
    end

    render 'posts/index'
  end
end

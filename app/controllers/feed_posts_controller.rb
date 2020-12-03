class FeedPostsController < ApplicationController
  before_action :authenticate_account!

  def index
    @acc = current_account
    if current_account.followings.exists?
      @posts = Post.where(account_id: current_account.followings.pluck(:id)).order(created_at: :desc)
    else
      @posts = Post.none
    end

    render 'posts/index'
  end
end

# app/controllers/likes_controller.rb
# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :load_post

  def create
    if already_liked?
      #flash: { notice: "You can't like more than once" }
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(account_id: current_account.id)
      redirect_to account_post_path(@post.account, @post)
    end
  end

  private

  def already_liked?
    Like.where(account_id: current_account.id, post_id: @post.id).exists?
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end

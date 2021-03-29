# app/controllers/likes_controller.rb
# frozen_string_literal: true

# class describing the likes controller
class LikesController < ApplicationController
  before_action :load_post

  def index
    @likes = @post.likes
  end

  def create
    return unless no_like?

    @post.likes.create(account_id: current_account.id)
    redirect_to account_post_path(@post.account, @post)
  end

  def destroy
    @like = @post.likes.find(params[:id])
    @like.destroy
    redirect_to account_post_path(@post.account, @post)
  end

  private

  def no_like?
    Like.where(account_id: current_account.id, post_id: @post.id).empty?
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end

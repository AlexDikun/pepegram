# app/controllers/comments_controller.rb
# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_account!, only: %i[new create destroy]
  before_action :load_post

  include Pundit

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.account = current_account
    if @comment.save
      redirect_to account_post_path(@post.account, @post), flash: { success: 'Post was added' }
    else
      render :new, flash: { alert: 'Some error occured' }
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to account_post_path(@post.account, @post)
  end

  private

  def pundit_user
    current_account
  end

  def load_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:message)
  end
end

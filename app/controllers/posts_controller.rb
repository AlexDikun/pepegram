# app/controllers/posts_controller.rb
# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_account!, only: %i[new create edit update destroy]
  before_action :load_account

  include Pundit

  def index
    @posts = @acc.posts
  end

  def show
    @post = @acc.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.account = @acc
    if @post.save
      redirect_to account_post_path(@acc, @post), flash: { success: 'Post was added' }
    else
      render :new, flash: { alert: 'Some error occured' }
    end
  end

  def edit
    @post = @acc.posts.find(params[:id])
    authorize @post
  end

  def update
    @post = @acc.posts.find(params[:id])
    authorize @post
    @post.update(post_params)
    redirect_to account_post_path(@acc, @post), flash: { success: 'Post was updated' }
  end

  def destroy
    @post = @acc.posts.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to action: :index
  end

  def post_params
    params.require(:post).permit(:title, :message, :image)
  end

  private

  def load_account
    @acc = Account.find(params[:account_id])
  end
end

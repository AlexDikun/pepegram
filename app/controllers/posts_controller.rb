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
    @post.image_derivatives! if @post.valid?
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
    if @post.update(post_params)
      @post.image_derivatives! if @post.valid?
      @post.save
      redirect_to account_post_path(@acc, @post), flash: { success: 'Post was updated' }
    else
      render :edit
    end
  end

  def destroy
    @post = @acc.posts.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to action: :index
  end

  private

  def post_params
    params.require(:post).permit(:title, :message, :image)
  end

  def pundit_user
    current_account
  end

  def load_account
    @acc = Account.find(params[:account_id])
  end
end

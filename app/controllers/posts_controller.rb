class PostsController < ApplicationController
  before_action :authenticate_account!, only: [:new, :create, :edit, :update,
                                                                      :destroy]
  before_action :load_account

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
    @post = Post.new(params.require(:post).permit(:title, :body))
    @post.account = @acc
    if @post.save
      redirect_to account_post_path(@acc, @post), flash: {success: "Post was added"}
    else
      render :new, flash: {alert: "Some error occured"}
    end
  end

  def edit
    @post = @acc.posts.find(params[:id])
  end

  def update
    @post = @acc.posts.find(params[:id])
    @post.update(post_params)
    redirect_to account_post_path(@acc, @post), flash: {success: "Post was updated"}
  end

  def destroy
    @post = @acc.posts.find(params[:id])
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

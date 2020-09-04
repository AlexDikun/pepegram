class PostsController < ApplicationController
  validates :title, presence: true, length:{ maximum: 300 }
  validates :body, presence: true

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    if post.save
      redirect_to post, flash: {success: "Post was added"}
    else
      render :new flash: {alert: "Some error occured"}
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post = Post.update(params.require(:post).permit(:title, :body))
    redirect_to post, flash: {success: "Post was updated"}
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to action: :index
  end

  def post_params
    params.require(:post).permit(:title, :message, :image)
  end

end

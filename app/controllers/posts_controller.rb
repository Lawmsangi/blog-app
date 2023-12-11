class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = @user.posts
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :text))
    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end

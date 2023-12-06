class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :set_user

  def index
    @posts = @user.posts
  end

  def show; end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :text))
    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end

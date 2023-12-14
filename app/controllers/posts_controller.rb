class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user

  def index
    @posts = @user.posts
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  # def destroy
  #   @user = User.find(params[:user_id])
  #   @post = @user.posts.find(params[:id])
  #   @post.likes.destroy_all
  #   if @post.destroy
  #     redirect_to user_posts_path(@user), notice: 'Post was successfully deleted.'
  #   else
  #     redirect_to user_post_path(@user, @post), alert: 'Failed to delete post.'
  #   end
  # end


  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def index
    post = Post.find(params[:post_id])
    @comments = post.comments
    render json: @comments
  end

  def create
    user_id = params[:user_id]
    post_id = params[:post_id]
    @comment = Comment.new(user_id: user_id, post_id: post_id, text: comment_params[:text])

    if @comment.save
      render json: { message: 'Comment saved successfully!' }
    else
      render json: { error: 'Error creating comment' }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

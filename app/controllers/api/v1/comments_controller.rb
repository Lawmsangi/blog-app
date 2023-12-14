# class Api::V1::CommentsController < ApplicationController
#   def index
#     @comments = current_user.comments
#     render json: @comments
#   end

#   def create
#     post_id = params[:post_id]
#     @comment = Comment.new(user_id: current_user.id, post_id:, text: comment_params[:text])

#     if @comment.save
#       render json: 'Comment saved successfully!'
#     else
#       render json: { error: 'Error creating comment' }
#     end
#   end

#   def comment_params
#     params.require(:comment).permit(:text)
#   end
# end

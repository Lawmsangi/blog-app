class CommentsController < ApplicationController
  def create
    post_id = params[:post_id]
    @comment = Comment.new(user_id: current_user.id, post_id:, text: comment_params[:text])

    if @comment.save
      puts 'Comment saved successfully!'
      redirect_to user_post_path(current_user.id, post_id), notice: 'Comment created successfully.'
    else
      render :new
    end
  end

  def new
    @comment = Comment.new
  end

  # def destroy
  #   @user = User.find(params[:user_id])
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.find(params[:id])
  #   if @comment.destroy
  #     redirect_to user_post_path(@user, @post), notice: 'Comment deleted successfully.'
  #   else
  #     redirect_to user_post_path(@user, @post), notice: 'Comment could not be deleted.'
  #   end
  # end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

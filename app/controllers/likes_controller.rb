class LikesController < ApplicationController
  def create
    post_id = params[:post_id]
    @like = Like.new(user_id: current_user.id, post_id:)

    if @like.save
      puts 'Like saved successfully!'
      redirect_to user_post_path(current_user.id, post_id), notice: 'Like created successfully.'
    else
      render :new
    end
  end
end

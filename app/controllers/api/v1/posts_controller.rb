class Api::V1::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  def index
    user_id = params[:user_id]
    user = User.find(user_id)
    @posts = user.posts
    render json: @posts
  end
end

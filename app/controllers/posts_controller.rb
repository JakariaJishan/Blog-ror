class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
  end

  def show
    @post_id = params[:id]
    @user_id = params[:user_id]
  end
end

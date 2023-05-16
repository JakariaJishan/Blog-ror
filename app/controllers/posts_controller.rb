class PostsController < ApplicationController
  def index; end

  def show
    @post_id = params[:id]
    @user_id = params[:user_id]
  end
end

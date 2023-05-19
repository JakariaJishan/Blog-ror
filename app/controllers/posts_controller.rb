class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
   @post = Post.new(post_params)
   @post.author = current_user
    puts :post
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"
    else 
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(author_id: current_user.id, comments_counter: 0, likes_counter: 0)
  end

end

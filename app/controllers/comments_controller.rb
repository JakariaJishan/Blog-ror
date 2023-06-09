class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments
  end

  def add_comment
    @new_comment = Comment.new(params.require(:comment).permit(:text))
    @new_comment.author = current_user
    @new_comment.post = Post.find(params[:id])

    if @new_comment.save
      render json: @new_comment, status: :created
    else
      render json: { error: 'error creating...' }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @user = @post.author
    authorize! :destroy, @comment
    @post.comments_counter -= 1
    @user.posts_counter -= 1
    @comment.destroy
    @post.save
    @user.save
    puts @comment.errors.full_messages if @comment.errors.any?
    redirect_to user_post_path(@user.id, @post.id), notice: 'Comment deleted successfully.'
  end
end

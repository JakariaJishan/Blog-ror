class CommentsController < ApplicationController
  # load_and_authorize_resource
  def add_comment
    @new_comment = Comment.new(params.require(:comment).permit(:text))
    @new_comment.author = current_user
    @new_comment.post = Post.find(params[:id])
    if @new_comment.save
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:id]}", notice: 'Your Comment Added'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @user = @post.author
    authorize! :destroy, @comment
    # @post.comments_counter -= 1
    # @user.posts_counter -= 1
    @comment.destroy
    @post.save
    @user.save
      
      redirect_to user_post_path(@user.id,@post.id ) , notice: 'Comment deleted successfully.'
  end
end

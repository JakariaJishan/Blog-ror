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

  
end

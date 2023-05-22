class UsersController < ApplicationController
  def index
    @users = User.all
    @users.each do |user|
      puts user
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.last_three_post
  end
end

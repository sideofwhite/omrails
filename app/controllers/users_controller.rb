class UsersController < ApplicationController
  def show
  @user = User.friendly.find(params[:id])
  @comments = @user.get_voted Comment
  
  end

  def questions
  @user = User.friendly.find(params[:id])
  @posts = @user.posts
  @comments = @user.comments.page(params[:page]).per_page(25)
  @questions = @user.questions
  end 
end

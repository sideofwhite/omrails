class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  @posts = @user.posts
  @comments = @user.comments
  @questions = @user.questions.page(params[:page]).per(25)
  end

  def questions
  @user = User.find(params[:id])
  @posts = @user.posts
  @comments = @user.comments.page(params[:page]).per(25)
  @questions = @user.questions
  end 
end

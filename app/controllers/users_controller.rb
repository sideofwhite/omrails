class UsersController < ApplicationController
  def show
  @user = User.friendly.find(params[:id])
  @questions = @user.get_voted Question
  
  end

  def questions
  @user = User.friendly.find(params[:id])
  @comments = @user.comments.page(params[:page]).per_page(25)
  end 
end

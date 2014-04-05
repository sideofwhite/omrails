class UsersController < ApplicationController
  def show
  @user = User.friendly.find(params[:id])
  @questions = @user.get_voted Question
  @comments = @user.comments.order(:created_at)
  end

  def questions
  @user = User.friendly.find(params[:id])
  @question = @user.questions.order(:created_at)
  
  end 
end

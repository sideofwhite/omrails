class UsersController < ApplicationController
  def show
  @user = User.friendly.find(params[:id])
  @questions = @user.get_voted Question.limit(5)
  @comments = @user.comments.order(:created_at)
  end

  def upvoted 
  @user = User.friendly.find(params[:id])
  @questions = @user.get_voted Question.offset(5)
  end

  def questions
  @user = User.friendly.find(params[:id])
  @question = @user.questions.order("created_at desc")
  @comments = @user.comments.order(:created_at)
  end 

   def interviews
  @user = User.friendly.find(params[:id])
  @comment = @user.comments.order("created_at desc")
  end 

  def notifications 
  @user = User.friendly.find(params[:id])
  @comment = @user.comments
  @answers = @comment.questions
  end

end

class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  @comments = @user.find_voted_items
  @posts = Post.where(id: comments.pluck(:post_id))
  end

  def questions
  @user = User.find(params[:id])
  @posts = @user.posts
  @comments = @user.comments.page(params[:page]).per_page(25)
  @questions = @user.questions
  end 
end

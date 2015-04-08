class PagesController < ApplicationController
  
  
  def home
  end


  def following 
  @skip_footer = true  
  if user_signed_in?
  @skip_bottom = true    
  @user = current_user 
  @following = @user.get_voted Comment .order("created_at desc").page(params[:page]).per_page(3)
  else 
  @post = Post.where(:hide => true).order("RANDOM()").limit(1)
  end
  end


  def about
  	@skip_bottom = true  
    @skip_footer = true 
  end
  def contact
    @skip_bottom = true  
    @skip_footer = true 
 
  end
   def guidelines
   @skip_bottom = true  
   @skip_footer = true 
  end
  def tos
      @skip_bottom = true  
    @skip_footer = true 
  end

  def browser
     @skip_footer = true  
  
  end

  def admin_questions
  @comments = Comment.all.order("created_at desc")
  end 

end

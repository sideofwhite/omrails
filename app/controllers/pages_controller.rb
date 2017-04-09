class PagesController < ApplicationController
  
  
  def home
  end


  def following 
  if user_signed_in?  
  @user = current_user 
  @following = @user.get_voted Post .order("created_at desc").page(params[:page]).per_page(3)
  else 
  @post = Post.where(:hide => true).order("RANDOM()").limit(1)
  end
  end


  def about
  	 
   @skip_footer = true   
    
  end
  def contact
 
    @skip_footer = true 
 
  end
   def guidelines
     
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
  @skip_footer = true   
  @comments = Comment.all.order("created_at desc")
  end 

  def admin_answers
  @skip_footer = true   
  @answers = Question.all.order("created_at desc")
  end 

  def admin_replies
  @skip_footer = true   
  @replies = Link.all.order("created_at desc")
  end 

end

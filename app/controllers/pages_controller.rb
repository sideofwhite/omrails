class PagesController < ApplicationController
  
  
  def home
  end
  def about
  	
    @skip_footer = true 
  end
  def contact
    @skip_footer = true 
 
  end
   def guidelines
  	@skip_bottom = true  
  end
  def tos
      
  end

  def browser
     @skip_footer = true  
  
  end

  def admin_questions
  @comments = Comment.all.order("created_at desc")
  end 

end

class PagesController < ApplicationController
  def home
  end
  def about
  	@skip_bottom = true  
  end
  def contact
  	@skip_bottom = true  
  end
   def guidelines
  	@skip_bottom = true  
  end
  def tos
      
  end

  def browser
     @skip_footer = true  
  
  end
end

class SessionsController < Devise::SessionsController


  def new
      @skip_footer = true 
      super
    
  end
end
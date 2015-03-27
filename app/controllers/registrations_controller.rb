class RegistrationsController < Devise::RegistrationsController
    def info
      @skip_footer = true 
      @redirect = true
      @posts = Post.where(:hide => true).order("position").limit(1)

        @user = current_user
        if @user 
            render :info
        else
            redirect_to root_path
         end 
    end

    def new
      @skip_footer = true  
      super
    
  end

   def edit
      @skip_footer = true  
      super
    
  end


   def update

    @redirect = false
    # For Rails 4
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end



    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true

    if URI(request.referer).path == '/info'
  redirect_to root_path, notice: "Welcome to Podium" 
else 
 redirect_to user_path(@user), notice: "Updates Saved" 
 end

    else
      render "edit"
    end
  end

   def save_my_previous_url
  if URI(request.referer).path
    session[:my_previouse_url] = URI( (request.referer || "") ).path
  else
    session[:my_previouse_url] = URI( (request.referer || "") ).path
  end
end


  
  protected

  def after_sign_up_path_for(resource)
    '/info'
  end






 end
class RegistrationsController < Devise::RegistrationsController
    def info
        @user = current_user
        if @user 
            render :info
        else
            redirect_to root_path
         end 
    end

 def update
    @user = User.find(current_user.id)

   
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      
      @user.update_without_password(devise_parameter_sanitizer.for(:account_update))
      # Rails 3: @user.update_without_password(params[:user])
    
      redirect_to user_path(current_user)
   
  end



  
  protected

  def after_sign_up_path_for(resource)
    '/info'
  end






 end
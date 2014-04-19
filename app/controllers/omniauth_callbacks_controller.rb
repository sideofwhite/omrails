class OmniauthCallbacksController < Devise::OmniauthCallbacksController
def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted? and user.email.nil?
     sign_in(user) 
     redirect_to '/info'
    elsif user.persisted? and user.email.present?
     sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :twitter, :all

end

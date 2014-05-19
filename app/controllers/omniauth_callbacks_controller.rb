class OmniauthCallbacksController < Devise::OmniauthCallbacksController
def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted? and user.email.present?
      sign_in_and_redirect user
    elsif user.persisted? and user.email.blank?
      sign_in user and redirect_to info_path
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :twitter, :all

end

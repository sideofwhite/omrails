class ApplicationController < ActionController::Base
  helper_method :notificationcount
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include PublicActivity::StoreController
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_location

def store_location
  # store last url as long as it isn't a /users path
  session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
end

 def notificationcount
  PublicActivity::Activity.where(recipient_id: current_user.id).where(:read => false).count 
 end

 use Browser::Middleware do
  redirect_to "/browser" unless browser.modern?
  if browser.ie10? 
    redirect_to "/browser" 
  elsif browser.ie9? 
   redirect_to "/browser"  
  end
end


 protected

def after_sign_in_path_for(resource)
  session[:previous_url][/[^\?_]+/] || root_path
end

def render_forbidden
  respond_to do |format|
    raise ActionController::RoutingError.new('Not Found')
    #...
  end
  true
end

  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :image, :place, :age) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :current_password, :password, :password_confirmation, :image, :place, :age) }

  

  end
 end
  



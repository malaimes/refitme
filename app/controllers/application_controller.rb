class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_location

def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get? 
  if (request.path != "/auth/login" &&
      request.path != "/auth/register" &&
      request.path != "/auth/password/new" &&
      request.path != "/auth/password/edit" &&
      request.path != "/auth/confirmation" &&
      request.path != "/auth/logout" &&
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath 
  end
end

def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :username
  	devise_parameter_sanitizer.for(:account_update ) << :username
  end

  
end

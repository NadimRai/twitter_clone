class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #call the configured params
  before_action :configure_permittted_parameters, if: :devise_controller?

  #protect the database, while allowing these fields to be updated
  protected
  def configure_permittted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password])
  end
end

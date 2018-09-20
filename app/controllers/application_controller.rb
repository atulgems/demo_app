class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :select_layout

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # sign up parameters.
    # binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :date_of_birth])
  end

  def select_layout
    if  user_signed_in?
      "application"
    else
      "before_login"
    end
  end
end

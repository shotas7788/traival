class ApplicationController < ActionController::Base

  # ==========CSRF対策+nameカラム, usernameカラムをストロングパラメータへ==========
  protect_from_forgery with: :exception 
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :profile_photo])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :profile_photo])
    end
  # ==========CSRF対策+nameカラム, usernameカラムをストロングパラメータへ==========
end

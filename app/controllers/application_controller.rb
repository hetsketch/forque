# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:username, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |user|
      user.permit(:email, :password, :remember_me)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:username, :first_name, :last_name, :position, :bio,
                  :city, :avatar, :current_password, :password,
                  :password_confirmation, :avatar_crop_x, :avatar_crop_y,
                  :avatar_crop_w, :avatar_crop_h)
    end
  end
end

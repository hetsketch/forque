# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    callback_handler('github')
  end

  def vkontakte
    callback_handler('vkontakte')
  end

  def google_oauth2
    callback_handler('google')
  end

  def failure
    redirect_to root_path
  end

  private

  def callback_handler(auth)
    @user = User.create_with_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      # this will throw if @user is not activated
      sign_in_and_redirect @user, event: :authentication
      if is_navigational_format?
        set_flash_message(:notice, :success, kind: auth.capitalize)
      end
    else
      session["devise.#{auth}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end

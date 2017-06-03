# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def create
    auth = request.env['omniauth.auth']
    if auth
      @user = User.create_with_omniauth(auth)
      sign_in_and_redirect @user, event: :authentication if @user.persisted?
    else
      sign_up
    end

    session[:user_id] = @user.id
    redirect_to root_url, notice: 'Signed in!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Signed out!'
  end

  private

  def user_params
    params.require(:user).permit(
      :username, :email, :password, :password_confirmation, :remember_me,
      :first_name, :last_name, :address, :city, :bio
    )
  end
end

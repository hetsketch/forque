class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :address, :city, :bio)
  end
end

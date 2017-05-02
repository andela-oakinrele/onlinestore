class UsersController < ApplicationController

  layout "login"

  before_action :role_id, only: :create

  def new
    @vendor = Role.find_by_title("Vendor")
  end

  def create
    @user = User.create(user_params)
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(
        :firstname,
        :lastname,
        :password,
        :password_confirmation,
        :email,
        :role_id
    )
  end

  def role_id
    return if params[:user][:role_id]
    params[:user][:role_id] = Role.find_by_title("User").id
  end
end

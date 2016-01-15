class Admin::UsersController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user.admin?
      @users = User.all
    else
      raise_error
    end
  end

  def update
    user = User.find(params[:id])
    if user.admin?
      user.role = 'member'
    else
      user.role = 'admin'
    end
    user.save
    redirect_to admin_users_path
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end
end

class Hr::UsersController < ApplicationController

  before_action :get_user, only: [:edit, :update]

  def index
    @users = User.all
    authorize [:hr, @users]
  end

  def edit
    authorize [:hr, @user]
  end

  def update
    @user.update user_params
    authorize [:hr, @user]
  end

  private

  def get_user
    @user = User.find(params[:id])
    authorize @user, :edit?
  end

  def user_params
    params.require(:user).permit(:employee_number)
  end

end

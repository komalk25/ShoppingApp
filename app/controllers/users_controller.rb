class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def profile
    @profile = User.find(params[:id])
  end

  def show
    @user = User.find_by(id: current_user.id)
    @cart = Cart.find_by(user_id: current_user.id)
  end

  def edit
    @user = User.find_by(id: current_user.id)
  end

  def update
    @user = User.find_by(id: current_user.id)

    redirect_to user_path if @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :pincode, :state, :phone)
  end
end

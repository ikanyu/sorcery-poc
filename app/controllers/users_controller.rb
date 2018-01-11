class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.add_role :admin if params[:user][:admin_role] == '1'

      redirect_to user_path(@user), notice: 'Signed up'
    else
      render :new, notice: 'Failed to sign up'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

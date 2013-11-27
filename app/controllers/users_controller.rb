class UsersController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
  end

  def show
    set_user
  end

  def index
    @users = User.all
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

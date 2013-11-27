class UsersController < ApplicationController
  
  before_filter :is_user_admin?, except: [:create, :show, :index]

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

    def is_user_admin?
      redirect_to(root_url, notice: "Hey! You can't do that if you're not an admin.") unless current_user.admin?
    end
end

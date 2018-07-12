class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.new(user_parms)
    if @user.save
      login_user!
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end


  private
  def user_params
    params.require(:user).allow(:email, :password)
  end
end

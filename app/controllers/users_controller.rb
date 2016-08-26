class UsersController < ApplicationController

  skip_before_action :require_login, :only => [:index, :new, :create]
  before_action :require_current_user, :only => [:edit, :update, :destroy]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = "User created."
      redirect_to @user
    else
      flash.now[:danger] = "User not created. Error."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User updated."
      redirect_to @user
    else
      flash.now[:danger] = "User not updated. Error."
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      sign_out
      flash[:success] = "User deleted."
      redirect_to root_url
    else
      flash[:danger] = "User not deleted. Error."
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end

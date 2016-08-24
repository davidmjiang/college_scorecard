class SessionsController < ApplicationController

  skip_before_action :require_login, :only => [:create, :new, :destroy]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "You've successfully signed in"
      redirect_to @user
    else
      flash.now[:error] = "We couldn't sign you in"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "You've successfully signed out"
    redirect_to root_url
  end

end

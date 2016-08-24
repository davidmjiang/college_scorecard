class ReviewsController < ApplicationController
  def create
    @user = current_user
    @review = Review.new(whitelisted_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
    @user = current_user
    @review = Review.new
  end

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @reviews = @user.reviews
    elsif params[:school_id]
      @school = School.find(params[:school_id])
      @reviews = @school.reviews
    end
  end

  def show
  end
end

class ReviewsController < ApplicationController
  before_action :edit, :update, :destroy, :require_current_user

  def create
    @user = current_user
    @review = Review.new(whitelisted_params)
    @school = School.find(params[:school_id])
    if @review.save 
      flash[:success] = "Thank you for sharing your opinion."
      redirect_to school_review_path(@school, @review)
    else
      flash[:error] = @review.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @user = current_user
    @review = Review.find(params[:id])
    @school = @review.school
  end

  def update
    @review = Review.find(params[:id])
    @school = @review.school
    if @review.update(whitelisted_params)
      flash[:sucess] = "Changes have been made to reflect your wavering opinion."
      redirect_to school_review_path(@school, @review)
    else  
      flash[:error] = @review.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
  end

  def new
    @user = current_user
    @review = Review.new
    @school = School.find(params[:school_id])
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
    @review = Review.find(params[:id])
  end



  private

  def whitelisted_params
    params.require(:review).permit(:body, :school_id, :user_id, :id)
  end
end

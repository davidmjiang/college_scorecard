class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.new(whitelisted_params)
    @school = School.find(params[:school_id])
    @review.school = @school
    if @review.save
      flash[:success] = 'Thank you for sharing your opinion.'
      redirect_to school_review_path(@school, @review)
    else
      flash[:danger] = @review.errors.full_messages.join(', ')
      redirect_to school_path(@school)
    end
  end

  def edit
    @user = current_user
    if @user.reviews.exists?(params[:id])
      @review = @user.reviews.find(params[:id])
      @school = @review.school
    else
      flash[:danger] = "You can't do that. HMMMMMMM"
      redirect_to @user
    end
  end

  def update
    if current_user.reviews.exists?(params[:id])
      @review = current_user.reviews.find(params[:id])
      @school = @review.school
      if @review.update(whitelisted_params)
        flash[:success] = 'Changes have been made to reflect your wavering opinion.'
        redirect_to school_review_path(@school, @review)
      else
        flash[:danger] = @review.errors.full_messages.join(', ')
        render :edit
      end
    else
      flash[:danger] = "You can't do that"
      redirect_to current_user
    end
  end

  def destroy
    @user = current_user
    @review = @user.reviews.find_by_id(params[:id])
    if @review.destroy 
      flash[:success] = "Your review has been deleted."
      redirect_to @user
    else
      flash[:error] = "There was a problem deleting your review. #{@review.errors.full_messages.join(", ")}"
      render :edit
    end
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
      @review = Review.new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def whitelisted_params
    params.require(:review).permit(:body)
  end
end

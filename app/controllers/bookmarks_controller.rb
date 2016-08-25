class BookmarksController < ApplicationController

  def create
    @school = School.find(params[:school_id])
    if current_user.schools << @school
      flash[:success] = "School added to your schools."
      redirect_back(fallback_location: current_user)
    else
      flash[:error] = "Error in adding school."
      redirect_back(fallback_location: current_user)
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      flash[:success] = "Status updated"
      redirect_to current_user
    else
      flash[:error]
      redirect_to current_user
    end
  end

  def destroy
    if current_user.schools.delete(params[:id])
      flash[:success] = "School removed from your schools."
      redirect_back(fallback_location: current_user)
    else
      flash[:error] = "Error in removing school."
      redirect_back(fallback_location: current_user)
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:essay, :letters, :application)
  end

end

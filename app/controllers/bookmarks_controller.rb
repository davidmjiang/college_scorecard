class BookmarksController < ApplicationController

  def create
    @school = School.find(params[:school_id])
    @bookmark = Bookmark.new(user_id: current_user.id, school_id: @school.id)
    if @bookmark.save
      flash[:success] = "School added to your schools."
      redirect_to @school
    else
      flash[:danger] = "Error in adding school."
      redirect_to @school
    end
  end

  def update
    if current_user.bookmarks.exists?(params[:id])
      @bookmark = current_user.bookmarks.find(params[:id])
      if @bookmark.update(bookmark_params)
        flash[:success] = "Status updated"
      else
        flash[:danger] = "Update failed"
      end
    else
      flash[:danger] = "Not your bookmark"
    end
    redirect_to current_user
  end

  def destroy
    if current_user.bookmarks.exists?(params[:id])
      @bookmark = current_user.bookmarks.find(params[:id])
      if @bookmark.destroy
        flash[:success] = "School removed from your schools."
      else
        flash[:danger] = "Error in removing school."
      end
    else
      flash[:danger] = "Not your bookmark"
    end
      redirect_to :back
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:essay, :letters, :application)
  end

end

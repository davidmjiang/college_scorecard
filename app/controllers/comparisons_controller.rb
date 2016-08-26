class ComparisonsController < ApplicationController
  def index
    if params[:schools] == nil || params[:schools].length < 2
      flash[:danger] = "You must include at least 2 schools in the comparison"
      redirect_to :back
    elsif params[:schools].length > 5
      flash[:danger] = 'You can only include 5 schools in each comparison'
      redirect_to :back
    else
      @schools = []
      params[:schools].each do |school|
        if School.find(school)
          @schools << School.find(school)
        end
      end
      @schools
    end
  end
end

class ComparisonsController < ApplicationController


  def index
    if params[:schools].length > 5
      flash[:danger] = "You can only include 5 schools in each comparison"
      redirect_to :back
    end
    @schools = []
    params[:schools].each do |school|
      @schools << School.find(school)
    end
    @schools

  end
  
end

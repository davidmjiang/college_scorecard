class ComparisonsController < ApplicationController


  def index
    @schools = []
    params[:schools].each do |school|
      @schools << School.find(school)
    end
    @schools

  end
  
end

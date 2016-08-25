class SchoolsController < ApplicationController
	
	skip_before_action :require_login 

	def index
	  @query = School.search do
	  	fulltext "#{query_params[:school_name]}*"
	  end
		@schools = @query.results # TODO: add something to filter by search
	end

	def show
		@school = School.find(params[:id])
	end

	# private

	# def school_params
	# 	params.require(:school).permit()

	# end

	private

	def query_params
		params.permit(:utf8, :commit, :query => [:school_name, :school_region_id, :school_locale])[:query]
	end
end

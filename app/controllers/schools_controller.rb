class SchoolsController < ApplicationController
	
	skip_before_action :require_login 

	def index
		@schools = School.solr_search(query_params) # TODO: add something to filter by search
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
		params.permit(:query => [:name, :region, :locale])[:query]
	end
end

class SchoolsController < ApplicationController
	
	skip_before_action :require_login 

	def index
		@schools = School.all # TODO: add something to filter by search
	end

	def show
		@school = School.find(params[:id])
	end

	# private

	# def school_params
	# 	params.require(:school).permit()

	# end
end

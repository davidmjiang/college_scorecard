class SchoolsController < ApplicationController
  skip_before_action :require_login

  def index
    @query = School.search do
      fulltext "#{query_params[:school_name]}*"
      any_of do
        if query_params[:school_region_id]
          query_params[:school_region_id].each do |region_id|
            if query_params[:school_locale]
              query_params[:school_locale].each do |locale|
                all_of do
                  with(:school_region_id, region_id.to_i)
                  with(:school_locale, (locale.to_i - 2..locale.to_i))
                end
              end
            else
              with(:school_region_id, region_id.to_i)
            end
          end
        else
          query_params[:school_locale].each do |locale|
            with(:school_locale, (locale.to_i - 2..locale.to_i))
          end
        end
      end
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
    params.permit(:utf8, :commit, query: [:school_name, school_region_id: [], school_locale: []])[:query]
  end

  def region_numbers(regions)
    regions.map(&:to_i)
  end
end

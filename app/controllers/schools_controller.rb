class SchoolsController < ApplicationController
  skip_before_action :require_login

  def index
    @query = School.index_search(query_params)
    if params[:sort]
      options = [params[:sort], params[:order]]
      @query = sort_by(@query, options)
    end
    @schools = @query
  end

  def show
    @school = School.find(params[:id])
    @restaurants = YelpAPI.new.get_top_ten(@school).businesses
  end

  private

  def query_params
    params.permit(:utf8, :commit, query: [:school_name, school_region_id: [], school_locale: []])[:query]
  end

  def region_numbers(regions)
    regions.map(&:to_i)
  end

  def sort_by(query, options)
    # sanitizing inputs
    order = options[1] == 'ASC' ? 'ASC' : 'DESC'
    case options[0]
    when 'cost_in_state'
      query.joins(:cost).order("tuition_in_state #{order}")
    when 'cost_out_state'
      query.joins(:cost).order("tuition_out_of_state #{order}")
    when 'size'
      query.joins(:student).order("size #{order}")
    when 'selectivity'
      query.joins(:admission).order("admission_rate_overall #{order}")
    when 'sat_score'
      query.joins(:admission).order("sat_scores_average_overall #{order}")
    end
  end
end

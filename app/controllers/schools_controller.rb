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

  def sort_by(query, options)
    case options[0]
    when 'cost_in_state'
      query.joins(:cost).order("tuition_in_state #{options[1]}")
    when 'cost_out_state'
      query.joins(:cost).order("tuition_out_of_state #{options[1]}")
    when 'size'
      query.joins(:student).order("size #{options[1]}")
    when 'selectivity'
      query.joins(:admission).order("admission_rate_overall #{options[1]}")
    when 'sat_score'
      query.joins(:admission).order("sat_scores_average_overall #{options[1]}")
    end
  end
end

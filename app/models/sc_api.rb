class ScAPI
  attr_accessor :sort_desc
  attr_reader :response
  include HTTParty
  BASE_URI = 'https://api.data.gov/ed/collegescorecard/v1/schools.json?'
  def initialize
    @options = {}
    reset_request
    @fields = []
    @sort_desc = false
  end

  def get
    reset_request
    add_fields_to_request
    add_sort_to_request if @sort_opt
    @request += '&api_key=fXi2CD8bCMCZAVOI7nx0PgTVv766uCpyH6TvM4eN'
    @response = HTTParty.get(@request)
  end

  def add_sort_to_request
    @request += '&_sort=' + @sort_opt
    @request += ':desc' if @sort_desc == true
  end

  def add_sort_option(val)
    @sort_opt = val
  end

  def add_options()
  end

  def add_field(field)
    @fields << field
  end

  def add_fields_to_request
    @fields.each do |f|
      @request += f + ','
    end
  end

  def reset_request
    @request = BASE_URI + '_fields='
  end
end



'https://api.data.gov/ed/collegescorecard/v1/schools.json?_fields=id,school.name,2013.student.size,2013.admissions.admission_rate.overall&api_key=fXi2CD8bCMCZAVOI7nx0PgTVv766uCpyH6TvM4eN'

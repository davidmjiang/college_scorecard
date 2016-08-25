class ScAPI
  attr_accessor :sort_desc
  attr_reader :response, :request, :ATTRIBUTES, :fields
  include HTTParty
  BASE_URI = 'https://api.data.gov/ed/collegescorecard/v1/schools.json?'
  API_KEY = '&api_key=fXi2CD8bCMCZAVOI7nx0PgTVv766uCpyH6TvM4eN'
  def initialize
    reset_request
    @fields = []
    @sort_desc = false
    @request = ''
  end

  def update_request
    @request = BASE_URI + '_fields='
    add_fields_to_request if @fields.any?
    add_sort_to_request if @sort_opt
    add_page_to_request if @page
    add_per_page_to_request if @per_page
    @request += API_KEY
  end

  def get_school_info_by_name(name)
    @request = 'https://api.data.gov/ed/collegescorecard/v1/schools?school.name='
    name.split(' ').each_with_index do |p,i|
      @request += '%20' if i > 0
      @request += p
    end
    @request += API_KEY
    run_party_get
  end

  def add_sort_to_request
    @request += '&_sort=' + @sort_opt
    @request += ':desc' if @sort_desc == true
  end

  def add_sort_option(val)
    @sort_opt = val
  end

  def add_field(field)
    @fields << field
  end

  def reset_request
    @request = BASE_URI + 'school.ownership=1,2&_fields='
    @fields = []
    @sort_desc = false
  end

  def add_page_option(num)
    @page = "&_page=#{num}"
  end

  def add_per_page_option(num)
    @per_page = "&_per_page=#{num}"
  end

  def add_page_to_request
    @request += @page
  end

  def add_per_page_to_request
    @request += @per_page
  end

  def read_attributes
    file_path = Rails.root.join('attributes.txt')
    file = File.open(file_path, 'r')
    file.read.strip
  end

  def get_attributes
    attributes = read_attributes
    attributes.split(',').map do |attr|
      prefix = attr.split('.')[0]
      if prefix == 'school' || prefix == 'root'
        attr
      else
        attr = '2013.' + attr
      end
    end.compact
  end

  def get_type_attributes(type)
    if type == 'school' || type == 'root'
      get_attributes.delete_if do |attr|
        parts = attr.split('.')
        parts[0] != type
      end
    else
      get_attributes.delete_if do |attr|
        parts = attr.split('.')
        parts[1] != type
      end
    end
  end

  def add_type_attributes_as_fields(type)
    get_type_attributes(type).each do |attr|
      add_field(attr)
    end
  end

  def add_attributes_as_fields
    get_attributes.each do |attr|
      add_field(attr)
    end
  end

  def get_cat_responses
    categories = ['academics', 'admissions', 'aid', 'completion', 'cost', 'earnings', 'repayment', 'root', 'school', 'student']
    categories.map! do |cat|
      get_cat_response(cat)
    end
  end

  def setup_cat_response(category, page)
    reset_request
    default_options(page)
    add_school_name_as_field
    add_type_attributes_as_fields(category)
    add_fields_to_request
    add_sort_to_request if @sort_opt
    add_page_to_request if @page
    add_per_page_to_request if @per_page
    @request += '&api_key=fXi2CD8bCMCZAVOI7nx0PgTVv766uCpyH6TvM4eN'
  end

  def add_school_name_as_field
    add_field('school.name')
  end

  def run_party_get
    @response = HTTParty.get(@request)
  end

  def get_cat_response(category, page)
    page = page.to_s
    setup_cat_response(category, page)
    run_party_get
  end

  # def get_cat_response(category, page)
  #   page = page.to_s
  #   reset_request
  #   default_options(page)
  #   add_type_attributes_as_fields(category)
  #   get
  # end

  def add_fields_to_request
    @fields.each do |f|
      @request += f + ',' if f
    end
  end

  # 2013, sorted by school pop., first 200 results
  def default_options(page)
    @sort_desc = true
    add_sort_option('2013.admissions.sat_scores.25th_percentile.math')
    add_page_option(page)
    add_per_page_option('100')
  end

  def get
    add_fields_to_request
    add_sort_to_request if @sort_opt
    add_page_to_request if @page
    add_per_page_to_request if @per_page
    @request += '&api_key=fXi2CD8bCMCZAVOI7nx0PgTVv766uCpyH6TvM4eN'
    @response = HTTParty.get(@request)
  end

end

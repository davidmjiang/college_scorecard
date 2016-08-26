class School < ActiveRecord::Base
  has_one :academic, dependent: :destroy
  has_one :admission, dependent: :destroy
  has_one :aid, dependent: :destroy
  has_one :completion, dependent: :destroy
  has_one :cost, dependent: :destroy
  has_one :earning, dependent: :destroy
  has_one :repayment, dependent: :destroy
  has_one :student, dependent: :destroy

  has_many :reviews

  has_many :bookmarks

  has_many :users, through: :bookmarks

  def get_map_url
    response = get_coords_from_location
		"https://maps.googleapis.com/maps/api/staticmap?center=#{response["lat"]},#{response["lng"]}&zoom=15&size=400x400&key=AIzaSyDTLUeLPMNZy4Gw99gQNFF6d1gyDbukKmg"

  end

  def get_street_view
    response = get_coords_from_location
    "https://maps.googleapis.com/maps/api/streetview?size=400x400&location=#{response["lat"]},#{response["lng"]}&fov=90&heading=235&pitch=10&key=AIzaSyDzAzsvsSRGmqNCzBALyd8ISPylRAn5-mg"
  end

  def get_coords_from_location
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{urlify(school_name)},#{urlify(location)}&key=AIzaSyBi_LAVQdQK86p7BcCxTxYuPr1lKVC5HAw"
     response = HTTParty.get(url, verify: false)["results"]
    if response.empty?
      return { "lat" => 34.138792, "lng" => -118.125407 }
    else
      return response.first["geometry"]["location"]
    end
  end

  def urlify(location)
    location.gsub(" ", "+")
  end

	def location
   "#{school_city}, #{school_state}"
	end


	def urlify(location)
   location.gsub(" ", "+")
	end


	def popular_subjects
   attribs = academic.attributes
   attribs = attribs.delete_if { |k, v| k == "created_at" || k == "school_id" || k == "updated_at" || k == "id" }
   attribs = attribs.sort_by { |subject, percent| percent }.reverse[0..9].to_h
   attrib_keys = attribs.map do |k, v|
     k.gsub("program_percentage_", "")
     k.gsub("_", " ")
     k.titleize
   end
   attrib_keys.zip(attribs.values).to_h
	end

  def self.index_search(params)
    if params['school_name']
      school_name = params['school_name']
    end
    if params['school_region_id']
      region_ids = params['school_region_id'].map(&:to_i)
    end
    if params['school_locale']
      school_locales = params['school_locale'].map(&:to_i)
      school_locales.map! { |l| [l, l-1, l-2]}.flatten!
    end

    query = fuzzy_search_school(school_name) if school_name
    if query && school_locales
      query = query.where_school_locale_equals(school_locales)
    elsif school_locales
      query = where_school_locale_equals(school_locales)
    end
    if query && region_ids
      query = query.where_region_id_equals(region_ids)
    elsif region_ids
      query = where_region_id_equals(region_id)
    end
    query
  end

  def self.where_school_locale_equals(school_locales)
    where(school_locale: school_locales)
  end

  def self.where_region_id_equals(region_ids)
    where(school_region_id: region_ids)
  end

  def self.fuzzy_search_school(query)
    query = '%' + query + '%'
    where("school_name ILIKE ?", query)
  end
end



# queries = query.split(' ').map { |q| '%' + q + '%' }
# result = nil
# queries.each do |q|
#   if result.nil?
#     where("school_name ILIKE ?", q)
#   else
#     result.where("school_name ILIKE ?", q)
#   end
# end
# result

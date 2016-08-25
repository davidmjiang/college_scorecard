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


  searchable do
    text :school_name
    integer :school_region_id
    integer :school_locale
    float :admission do
      float :sat_scores_midpoint_critical_reading
      float :sat_scores_midpoint_math
      float :sat_scores_midpoint_writing
    end
  end

  def get_map_url
		"https://maps.googleapis.com/maps/api/staticmap?center=#{urlify(school_name)},#{urlify(location)}&zoom=15&size=400x400&key=AIzaSyDTLUeLPMNZy4Gw99gQNFF6d1gyDbukKmg"

  end

  def get_street_view
    response = get_coords_from_location
    "https://maps.googleapis.com/maps/api/streetview?size=400x400&location=#{response["lat"]},#{response["lng"]}&fov=90&heading=235&pitch=10&key=AIzaSyDzAzsvsSRGmqNCzBALyd8ISPylRAn5-mg"
  end

  def get_coords_from_location
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{urlify(school_name)},#{urlify(location)}&key=AIzaSyBi_LAVQdQK86p7BcCxTxYuPr1lKVC5HAw"
     response = HTTParty.get(url, verify: false)["results"].first["geometry"]["location"]
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


# Index search

def self.index_search(query_params)
  query = School.search do
    fulltext "#{query_params[:school_name]}*"
    with(:admission, :sat_scores_midpoint_math).less_than(600)
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
      elsif query_params[:school_locale]
        query_params[:school_locale].each do |locale|
          with(:school_locale, (locale.to_i - 2..locale.to_i))
        end
      end
    end
  end
  query
end




end

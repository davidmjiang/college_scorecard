class School < ActiveRecord::Base
  has_one :academic
  has_one :admission
  has_one :aid
  has_one :completion
  has_one :cost
  has_one :earning
  has_one :repayment
  has_one :student

  has_many :reviews

  has_many :bookmarks

  has_many :users, through: :bookmarks


  searchable do
    text :school_name
    #integer :school_region_id
    #integer :school_locale
  end

  def get_map_url
		"https://maps.googleapis.com/maps/api/staticmap?center=#{root_location_lat},#{root_location_lon}&zoom=17&size=300x300&key=#{Rails.application.secrets.gmaps_static_api_key}"
  end

	def location
		"#{school_city}, #{school_state}"
	end

	# def popular_subjects 
	# 	attribs = academic.attributes
	# 	attribs = attribs.delete_if { |k, v| k == "created_at" || 
	# 														 k == "school_id" || 
	# 														 k == "updated_at" ||
	# 														 k == "id"
	# 														 v.nil? }
	# 	attribs.sort_by { |subject, percent| percent }.keys[0..3]
	# end 


  # def self.search(queries)
  #   results = self.where("")
  #   if queries
  #     queries.each do |col, term|
  #       results = results.where("#{col} LIKE ?", "%#{term}%") if term.present?
  #     end
  #   end
  #   results
  # end
  
end



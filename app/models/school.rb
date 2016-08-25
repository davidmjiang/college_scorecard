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
  	
		"https://maps.googleapis.com/maps/api/staticmap?center=#{urlify(school_name)},#{urlify(location)}&zoom=15&size=300x300&key=AIzaSyDTLUeLPMNZy4Gw99gQNFF6d1gyDbukKmg"
  end


	def location
		"#{school_city}, #{school_state}"
	end


	def urlify(location)
		location.gsub(" ", "+")
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

end

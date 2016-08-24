class School < ActiveRecord::Base
  has_one :academic
  has_one :admission
  has_one :aid
  has_one :completion
  has_one :cost
  has_one :earning
  has_one :repayment
  has_one :student

  has_many :bookmarks
  has_many :users_who_bookmarked, through: :bookmarks, source: :users

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

end
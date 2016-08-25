module SchoolsHelper
	
	def get_aid_info(school)
		attribs = school.aid.attributes.delete_if { |k,v| k == "school_id" || k == "id" || k == "created_at" || k == "updated_at"}
	end

  def to_percent(value)
    if value.nil?
      "N/A"
    else
      "#{(value*100).round(2)}%"
    end
  end

  def subject_name(subject)
    subject.split(" ")[2..-1].join(" ")
  end

end

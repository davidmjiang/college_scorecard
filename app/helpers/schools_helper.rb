module SchoolsHelper
	
	def get_aid_info(school)
		attribs = school.aid.attributes.delete_if { |k,v| k == "school_id" || k == "id" || k == "created_at" || k == "updated_at"}
	end

  def to_percent(value)
    if value.nil?
      "N/A"
    else
      "#{(value*100).round(1)}%"
    end
  end

  def subject_name(subject)
    subject.split(" ")[2..-1].join(" ")
  end

  def float_to_int(f)
    if f
      f.to_i
    else
      ""
    end
  end


  def get_demographic_data(school)
    data = {}
    data["White"] = school.student.demographics_race_ethnicity_white
    data["Black"] = school.student.demographics_race_ethnicity_black
    data["Hispanic"] = school.student.demographics_race_ethnicity_hispanic
    data["Asian"] = school.student.demographics_race_ethnicity_asian
    data["American Indian/Alaska Native"] = school.student.demographics_race_ethnicity_aian
    data["Hawaiian Pacific Islander"] = school.student.demographics_race_ethnicity_nhpi
    data["Unknown"] = school.student.demographics_race_ethnicity_unknown
    data["Other"] = 1 - data["White"] - data["Black"] - data["Hispanic"] - data["Asian"] - data["American Indian/Alaska Native"] - data["Hawaiian Pacific Islander"] - data["Unknown"]
    data
  end
end

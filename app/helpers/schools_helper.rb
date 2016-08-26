module SchoolsHelper
	
	def get_aid_info(school)
		attribs = school.aid.attributes.delete_if { |k,v| k == "school_id" || k == "id" || k == "created_at" || k == "updated_at"}
	end

  def get_aid_keys(school)
    keys = school.aid.attributes.keys.delete_if {|k| k == "school_id" || k == "id" || k == "created_at" || k == "updated_at"}
  end

  def get_academic_keys(school)
    keys = school.academic.attributes.keys.delete_if {|k| k == "school_id" || k == "id" || k == "created_at" || k == "updated_at"}
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

  def get_cost_data(school)
    data = {}   
    if school.cost.net_price_private_by_income_level_0_30000
      data["0-$30,000"] = school.cost.net_price_private_by_income_level_0_30000
      data["$30,001-$48,000"] = school.cost.net_price_private_by_income_level_30001_48000
      data["$30,001-$48,000"] = school.cost.net_price_private_by_income_level_30001_48000
      data["$48,001-$75,000"] = school.cost.net_price_private_by_income_level_48001_75000
      data["$75,001-$110,000"] = school.cost.net_price_private_by_income_level_75001_110000
      data["$110,001+"] = school.cost.net_price_private_by_income_level_110001_plus
    elsif school.cost.net_price_public_by_income_level_0_30000
      data["0-$30,000"] = school.cost.net_price_public_by_income_level_0_30000
      data["$30,001-$48,000"] = school.cost.net_price_public_by_income_level_30001_48000
      data["$30,001-$48,000"] = school.cost.net_price_public_by_income_level_30001_48000
      data["$48,001-$75,000"] = school.cost.net_price_public_by_income_level_48001_75000
      data["$75,001-$110,000"] = school.cost.net_price_public_by_income_level_75001_110000
      data["$110,001+"] = school.cost.net_price_public_by_income_level_110001_plus
    end
    data
  end

  def get_sat_data(school)
    school_data = {}
    school_data["Critical Reading"] = school.admission.sat_scores_midpoint_critical_reading
    
    school_data["Critical Reading"] = Admission.average(:sat_scores_midpoint_critical_reading)

    school_data["Math"] = school.admission.sat_scores_midpoint_math
    school_data["Writing"] = school.admission.sat_scores_midpoint_writing
    avg_data = {"Critical Reading" => 495, "Math" => 511, "Writing" => 484 }
    [{name: "#{school.school_name}", data: school_data},{ name: "National Avg", data: avg_data}]
  end

  def get_act_data(school)
    school_data = {}
    school_data["Cummulative"] = school.admission.act_scores_midpoint_cumulative
    school_data["Math"] = school.admission.act_scores_midpoint_math
    school_data["Writing"] = school.admission.act_scores_midpoint_writing
    school_data["English"] = school.admission.act_scores_midpoint_english
    
    avg_data = {"Cummulative" => 21, "Writing" => 21.3, "English" => 20.3, "Math" => 20.9 }
    [{name: "#{school.school_name}", data: school_data},{ name: "National Avg", data: avg_data}]
  end


  def get_median_debt_data(school)
    data = []
    data << [20000, school.aid.median_debt_income_0_30000 ]
    data << [50000, school.aid.median_debt_income_30001_75000]
    data << [75000, school.aid.median_debt_income_greater_than_75000]
  end
end

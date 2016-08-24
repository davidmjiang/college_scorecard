class ScAPI
  attr_accessor :sort_desc
  attr_reader :response, :request, :ATTRIBUTES
  include HTTParty
  BASE_URI = 'https://api.data.gov/ed/collegescorecard/v1/schools.json?'
  def initialize
    @options = {}
    reset_request
    @fields = []
    @sort_desc = false
    @request = ''
  end

  def get_attributes
    ATTRIBUTES.split(',').map do |attr|
      prefix = attr.split('.')[0]
      attr = '2013.' + attr unless prefix == 'school' || prefix == 'root'
    end.compact
  end

  def get_type_attributes(type)
    get_attributes.delete_if do |attr|
      attr.split('.')[1] != type
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

  def get_cat_response(category)
    reset_request
    default_options
    add_type_attributes_as_fields(category)
    get
  end

  # 2013, sorted by school pop., first 200 results
  def default_options
    @sort_desc = true
    add_sort_option('2013.student.size')
    add_page_option('0')
    add_per_page_option('100')
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

  def get
    reset_request
    add_fields_to_request
    add_sort_to_request if @sort_opt
    add_page_to_request if @page
    add_per_page_to_request if @per_page
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
      @request += f + ',' if f
    end
  end

  def reset_request
    @request = BASE_URI + '_fields='
    @options = {}
    @fields = []
    @sort_desc = false
  end



  ATTRIBUTES = 'academics.program_percentage.agriculture,academics.program_percentage.resources,academics.program_percentage.architecture,academics.program_percentage.ethnic_cultural_gender,academics.program_percentage.communication,academics.program_percentage.communications_technology,academics.program_percentage.computer,academics.program_percentage.personal_culinary,academics.program_percentage.education,academics.program_percentage.engineering,academics.program_percentage.engineering_technology,academics.program_percentage.language,academics.program_percentage.family_consumer_science,academics.program_percentage.legal,academics.program_percentage.english,academics.program_percentage.humanities,academics.program_percentage.library,academics.program_percentage.biological,academics.program_percentage.mathematics,academics.program_percentage.military,academics.program_percentage.multidiscipline,academics.program_percentage.parks_recreation_fitness,academics.program_percentage.philosophy_religious,academics.program_percentage.theology_religious_vocation,academics.program_percentage.physical_science,academics.program_percentage.science_technology,academics.program_percentage.psychology,academics.program_percentage.security_law_enforcement,academics.program_percentage.public_administration_social_service,academics.program_percentage.social_science,academics.program_percentage.construction,academics.program_percentage.mechanic_repair_technology,academics.program_percentage.precision_production,academics.program_percentage.transportation,academics.program_percentage.visual_performing,academics.program_percentage.health,academics.program_percentage.business_marketing,academics.program_percentage.history,admissions.admission_rate.overall,admissions.admission_rate.by_ope_id,admissions.sat_scores.25th_percentile.critical_reading,admissions.sat_scores.75th_percentile.critical_reading,admissions.sat_scores.25th_percentile.math,admissions.sat_scores.75th_percentile.math,admissions.sat_scores.25th_percentile.writing,admissions.sat_scores.75th_percentile.writing,admissions.sat_scores.midpoint.critical_reading,admissions.sat_scores.midpoint.math,admissions.sat_scores.midpoint.writing,admissions.act_scores.25th_percentile.cumulative,admissions.act_scores.75th_percentile.cumulative,admissions.act_scores.25th_percentile.english,admissions.act_scores.75th_percentile.english,admissions.act_scores.25th_percentile.math,admissions.act_scores.75th_percentile.math,admissions.act_scores.25th_percentile.writing,admissions.act_scores.75th_percentile.writing,admissions.act_scores.midpoint.cumulative,admissions.act_scores.midpoint.english,admissions.act_scores.midpoint.math,admissions.act_scores.midpoint.writing,admissions.sat_scores.average.overall,admissions.sat_scores.average.by_ope_id,aid.pell_grant_rate,aid.federal_loan_rate,aid.median_debt.completers.overall,aid.median_debt.income.0_30000,aid.median_debt.income.30001_75000,aid.median_debt.income.greater_than_75000,aid.median_debt.first_generation_students,aid.median_debt.non_first_generation_students,aid.students_with_any_loan,completion.completion_rate_4yr_150nt,completion.completion_rate_less_than_4yr_150nt,completion.title_iv.withdrawn_by.2yrs,completion.title_iv.still_enrolled_by.2yrs,completion.title_iv.low_inc.still_enrolled_by.2yrs,completion.title_iv.mid_inc.still_enrolled_by.2yrs,completion.title_iv.high_inc.still_enrolled_by.2yrs,completion.title_iv.independ.withdrawn_by.2yrs,completion.title_iv.completed_by.4yrs,completion.title_iv.still_enrolled_by.4yrs,completion.title_iv.loan_recip.died_by.4yrs,completion.title_iv.no_loan.completed_by.4yrs,completion.title_iv.no_loan.withdrawn_by.4yrs,completion.title_iv.first_gen.died_by.4yrs,completion.title_iv.first_gen.completed_by.4yrs,completion.title_iv.first_gen.withdrawn_by.4yrs,completion.title_iv.first_gen.still_enrolled_by.4yrs,completion.title_iv.died_by.6yrs,completion.title_iv.completed_by.6yrs,completion.title_iv.withdrawn_by.6yrs,completion.title_iv.low_inc.died_by.6yrs,completion.title_iv.low_inc.completed_by.6yrs,completion.title_iv.low_inc.withdrawn_by.6yrs,completion.title_iv.mid_inc.died_by.6yrs,completion.title_iv.mid_inc.completed_by.6yrs,completion.title_iv.mid_inc.withdrawn_by.6yrs,completion.title_iv.high_inc.died_by.6yrs,completion.title_iv.high_inc.completed_by.6yrs,completion.title_iv.high_inc.withdrawn_by.6yrs,completion.title_iv.depend.died_by.6yrs,completion.title_iv.depend.completed_by.6yrs,completion.title_iv.depend.withdrawn_by.6yrs,completion.title_iv.independ.died_by.6yrs,completion.title_iv.independ.completed_by.6yrs,completion.title_iv.independ.withdrawn_by.6yrs,completion.title_iv.female.died_by.6yrs,completion.title_iv.female.completed_by.6yrs,completion.title_iv.female.withdrawn_by.6yrs,completion.title_iv.male.died_by.6yrs,completion.title_iv.male.completed_by.6yrs,completion.title_iv.male.withdrawn_by.6yrs,completion.title_iv.pell_recip.died_by.6yrs,completion.title_iv.pell_recip.completed_by.6yrs,completion.title_iv.pell_recip.withdrawn_by.6yrs,completion.title_iv.no_pell.died_by.6yrs,completion.title_iv.no_pell.completed_by.6yrs,completion.title_iv.no_pell.withdrawn_by.6yrs,completion.title_iv.loan_recip.died_by.6yrs,completion.title_iv.loan_recip.completed_by.6yrs,completion.title_iv.loan_recip.withdrawn_by.6yrs,completion.title_iv.no_loan.died_by.6yrs,completion.title_iv.no_loan.completed_by.6yrs,completion.title_iv.no_loan.withdrawn_by.6yrs,completion.title_iv.first_gen.died_by.6yrs,completion.title_iv.first_gen.completed_by.6yrs,completion.title_iv.first_gen.withdrawn_by.6yrs,completion.title_iv.not_first_gen.died_by.6yrs,completion.title_iv.not_first_gen.completed_by.6yrs,completion.title_iv.not_first_gen.withdrawn_by.6yrs,completion.title_iv.died_by.8yrs,completion.title_iv.not_first_gen.withdrawn_by.8yrs,completion.title_iv.not_first_gen.transf_withdrawn_4yr_by.8yrs,completion.6_yr_completion.overall,completion.6_yr_completion.low_income,completion.6_yr_completion.middle_income,completion.6_yr_completion.high_income,completion.6_yr_completion.dependent_students,completion.6_yr_completion.independent_students,completion.6_yr_completion.female_students,completion.6_yr_completion.male_students,completion.6_yr_completion.no_loan_students,completion.6_yr_completion.first_generation_students,completion.6_yr_completion.no_first_generation_students,cost.avg_net_price.public,cost.avg_net_price.private,cost.avg_net_price.program_year,cost.avg_net_price.other_academic_year,cost.net_price.public.by_income_level.0-30000,cost.net_price.public.by_income_level.30001-48000,cost.net_price.public.by_income_level.48001-75000,cost.net_price.public.by_income_level.75001-110000,cost.net_price.public.by_income_level.110001-plus,cost.net_price.private.by_income_level.0-30000,cost.net_price.private.by_income_level.30001-48000,cost.net_price.private.by_income_level.48001-75000,cost.net_price.private.by_income_level.75001-110000,cost.net_price.private.by_income_level.110001-plus,cost.net_price.program_reporter.by_income_level.0-30000,cost.net_price.program_reporter.by_income_level.30001-48000,cost.net_price.program_reporter.by_income_level.48001-75000,cost.net_price.program_reporter.by_income_level.75001-110000,cost.net_price.program_reporter.by_income_level.110001-plus,cost.net_price.other_acad_calendar.by_income_level.0-30000,cost.net_price.other_acad_calendar.by_income_level.30001-48000,cost.net_price.other_acad_calendar.by_income_level.48001-75000,cost.net_price.other_acad_calendar.by_income_level.75001-110000,cost.net_price.other_acad_calendar.by_income_level.110001-plus,cost.title_iv.public.all,cost.title_iv.private.all,cost.attendance.academic_year,cost.attendance.program_year,cost.tuition.in_state,cost.tuition.out_of_state,earnings.10_yrs_after_entry.not_working_not_enrolled.overall,earnings.10_yrs_after_entry.working_not_enrolled.overall,earnings.10_yrs_after_entry.working_not_enrolled.mean_earnings,earnings.10_yrs_after_entry.median,earnings.10_yrs_after_entry.working_not_enrolled.earnings_percentile.10,earnings.10_yrs_after_entry.working_not_enrolled.earnings_percentile.25,earnings.10_yrs_after_entry.working_not_enrolled.earnings_percentile.75,earnings.10_yrs_after_entry.working_not_enrolled.earnings_percentile.90,earnings.10_yrs_after_entry.percent_greater_than_25000,earnings.10_yrs_after_entry.mean_earnings.lowest_tercile,earnings.10_yrs_after_entry.mean_earnings.middle_tercile,earnings.10_yrs_after_entry.mean_earnings.highest_tercile,earnings.6_yrs_after_entry.working_not_enrolled.mean_earnings,earnings.6_yrs_after_entry.median,earnings.6_yrs_after_entry.working_not_enrolled.earnings_percentile.10,repayment.1_yr_repayment.completers,repayment.3_yr_repayment.completers,repayment.3_yr_repayment.income.0_30000,repayment.3_yr_repayment.income.30000_75000,repayment.3_yr_repayment.income.greater_than_75000,repayment.5_yr_repayment.pell_grant,repayment.7_yr_repayment.overall,repayment.7_yr_repayment.completers,root.location.lat,root.location.lon,school.name,school.city,school.state,school.school_url,school.price_calculator_url,school.state_fips,school.region_id,school.locale,school.ownership,school.under_investigation,student.size,student.enrollment.all,student.demographics.race_ethnicity.white,student.demographics.race_ethnicity.black,student.demographics.race_ethnicity.hispanic,student.demographics.race_ethnicity.asian,student.demographics.race_ethnicity.aian,student.demographics.race_ethnicity.nhpi,student.demographics.race_ethnicity.two_or_more,student.demographics.race_ethnicity.non_resident_alien,student.demographics.race_ethnicity.unknown,student.demographics.race_ethnicity.white_non_hispanic,student.demographics.race_ethnicity.black_non_hispanic,student.demographics.race_ethnicity.asian_pacific_islander,student.demographics.race_ethnicity.aian_prior_2009,student.demographics.race_ethnicity.hispanic_prior_2009,student.share_first.time_full.time,student.share_25_older,student.share_independent_students,student.share_independent_lowincome.0_30000,student.share_dependent_lowincome.0_300000,student.share_firstgeneration,student.share_middleincome.30001_48000,student.share_middleincome.30001_48000,student.share_highincome.75001_110000,student.share_highincome.110001plus,student.share_dependent_middleincome.300001_48000,student.share_firstgeneration_parents.middleschool,student.share_firstgeneration_parents.highschool,student.share_firstgeneration_parents.somecollege,student.family_income.overall,student.parents_education_level,student.FAFSA_applications,student.demographics.age_entry,student.demographics.over_23_at_entry,student.demographics.married,student.demographics.dependent,student.demographics.avg_family_income,student.demographics.median_family_income,student.demographics.median_hh_income,student.demographics.poverty_rate,student.demographics.unemployment'
end

class BuildTable
  class << self
    def build_table
      School.destroy_all
      results = aquire_api_data(1)
      results['school']['results'].each_with_index do |school_fields, index|
        school = create_new_school(school_fields)
        populate_secondary_tables(school, results, index)
      end
    end

    def aquire_api_data(num)
      scapi = ScAPI.new
      results = {}
      categories = %w(academics admissions aid completion cost earnings repayment school student)
      num.times do |i|
        categories.each do |cat|
          if results[cat]
            results[cat]['results'] += scapi.get_cat_response(cat, i)['results']
          else
            results[cat] = scapi.get_cat_response(cat, i)
          end
        end
      end
      results
    end

    def populate_secondary_tables(school, results, index)
      academic_results = results['academics']['results'][index]
      admissions_results = results['admissions']['results'][index]
      aid_results = results['aid']['results'][index]
      completion_results = results['completion']['results'][index]
      cost_results = results['cost']['results'][index]
      earnings_results = results['earnings']['results'][index]
      repayment_results = results['repayment']['results'][index]
      student_results = results['student']['results'][index]
      build_academic_table(school, academic_results)
      build_admission_table(school, admissions_results)
      build_aid_table(school, aid_results)
      build_completion_table(school, completion_results)
      build_cost_table(school, cost_results)
      build_earning_table(school, earnings_results)
      build_repayment_table(school, repayment_results)
      build_student_table(school, student_results)
    end

    def create_new_school(school_fields)
      school = School.new(
        school_name: school_fields['school.name'],
        school_city: school_fields['school.city'],
        school_state: school_fields['school.state'],
        school_school_url: school_fields['school.school_url'],
        school_price_calculator_url: school_fields['school.price_calculator_url'],
        school_state_fips: school_fields['school.state_fips'],
        school_region_id: school_fields['school.region_id'],
        school_locale: school_fields['school.locale'],
        school_ownership: school_fields['school.ownership'],
        school_under_investigation: school_fields['school.under_investigation']
      )
      school.save
      school
    end

    def build_academic_table(school, academic_results)
      school.create_academic(
        program_percentage_agriculture:                       academic_results['2013.academics.program_percentage.agriculture'],
        program_percentage_resources: academic_results['2013.academics.program_percentage.resources'],
        program_percentage_architecture: academic_results['2013.academics.program_percentage.architecture'],
        program_percentage_ethnic_cultural_gender: academic_results['2013.academics.program_percentage.ethnic_cultural_gender'],
        program_percentage_communication: academic_results['2013.academics.program_percentage.communication'],
        program_percentage_communications_technology: academic_results['2013.academics.program_percentage.communications_technology'],
        program_percentage_computer: academic_results['2013.academics.program_percentage.computer'],
        program_percentage_personal_culinary: academic_results['2013.academics.program_percentage.personal_culinary'],
        program_percentage_education: academic_results['2013.academics.program_percentage.education'],
        program_percentage_engineering: academic_results['2013.academics.program_percentage.engineering'],
        program_percentage_engineering_technology: academic_results['2013.academics.program_percentage.engineering_technology'],
        program_percentage_language: academic_results['2013.academics.program_percentage.language'],
        program_percentage_family_consumer_science: academic_results['2013.academics.program_percentage.family_consumer_science'],
        program_percentage_legal: academic_results['2013.academics.program_percentage.legal'],
        program_percentage_english: academic_results['2013.academics.program_percentage.english'],
        program_percentage_humanities: academic_results['2013.academics.program_percentage.humanities'],
        program_percentage_library: academic_results['2013.academics.program_percentage.library'],
        program_percentage_biological: academic_results['2013.academics.program_percentage.biological'],
        program_percentage_mathematics: academic_results['2013.academics.program_percentage.mathematics'],
        program_percentage_military: academic_results['2013.academics.program_percentage.military'],
        program_percentage_multidiscipline: academic_results['2013.academics.program_percentage.multidiscipline'],
        program_percentage_parks_recreation_fitness: academic_results['2013.academics.program_percentage.parks_recreation_fitness'],
        program_percentage_philosophy_religious: academic_results['2013.academics.program_percentage.philosophy_religious'],
        program_percentage_theology_religious_vocation: academic_results['2013.academics.program_percentage.theology_religious_vocation'],
        program_percentage_physical_science: academic_results['2013.academics.program_percentage.physical_science'],
        program_percentage_science_technology: academic_results['2013.academics.program_percentage.science_technology'],
        program_percentage_psychology: academic_results['2013.academics.program_percentage.psychology'],
        program_percentage_security_law_enforcement: academic_results['2013.academics.program_percentage.security_law_enforcement'],
        program_percentage_public_administration_social_service: academic_results['2013.academics.program_percentage.public_administration_social_service'],
        program_percentage_social_science: academic_results['2013.academics.program_percentage.social_science'],
        program_percentage_construction: academic_results['2013.academics.program_percentage.construction'],
        program_percentage_mechanic_repair_technology: academic_results['2013.academics.program_percentage.mechanic_repair_technology'],
        program_percentage_precision_production: academic_results['2013.academics.program_percentage.precision_production'],
        program_percentage_transportation: academic_results['2013.academics.program_percentage.transportation'],
        program_percentage_visual_performing: academic_results['2013.academics.program_percentage.visual_performing'],
        program_percentage_health: academic_results['2013.academics.program_percentage.health'],
        program_percentage_business_marketing: academic_results['2013.academics.program_percentage.business_marketing'],
        program_percentage_history: academic_results['2013.academics.program_percentage.history']
      )
    end

    def build_admission_table(school, admissions_results)
      school.create_admission(
        admission_rate_overall: admissions_results['2013.admissions.admission_rate.overall'],
        admission_rate_by_ope_id: admissions_results['2013.admissions.admission_rate.by_ope_id'],
        sat_scores_25th_percentile_critical_reading: admissions_results['2013.admissions.sat_scores.25th_percentile.critical_reading'],
        sat_scores_75th_percentile_critical_reading: admissions_results['2013.admissions.sat_scores.75th_percentile.critical_reading'],
        sat_scores_25th_percentile_math: admissions_results['2013.admissions.sat_scores.25th_percentile.math'],
        sat_scores_75th_percentile_math: admissions_results['2013.admissions.sat_scores.75th_percentile.math'],
        sat_scores_25th_percentile_writing: admissions_results['2013.admissions.sat_scores.25th_percentile.writing'],
        sat_scores_75th_percentile_writing: admissions_results['2013.admissions.sat_scores.75th_percentile.writing'],
        sat_scores_midpoint_critical_reading: admissions_results['2013.admissions.sat_scores.midpoint.critical_reading'],
        sat_scores_midpoint_math: admissions_results['2013.admissions.sat_scores.midpoint.math'],
        sat_scores_midpoint_writing: admissions_results['2013.admissions.sat_scores.midpoint.writing'],
        act_scores_25th_percentile_cumulative: admissions_results['2013.admissions.act_scores.25th_percentile.cumulative'],
        act_scores_75th_percentile_cumulative: admissions_results['2013.admissions.act_scores.75th_percentile.cumulative'],
        act_scores_25th_percentile_english: admissions_results['2013.admissions.act_scores.25th_percentile.english'],
        act_scores_75th_percentile_english: admissions_results['2013.admissions.act_scores.75th_percentile.english'],
        act_scores_25th_percentile_math: admissions_results['2013.admissions.act_scores.25th_percentile.math'],
        act_scores_75th_percentile_math: admissions_results['2013.admissions.act_scores.75th_percentile.math'],
        act_scores_25th_percentile_writing: admissions_results['2013.admissions.act_scores.25th_percentile.writing'],
        act_scores_75th_percentile_writing: admissions_results['2013.admissions.act_scores.75th_percentile.writing'],
        act_scores_midpoint_cumulative: admissions_results['2013.admissions.act_scores.midpoint.cumulative'],
        act_scores_midpoint_english: admissions_results['2013.admissions.act_scores.midpoint.english'],
        act_scores_midpoint_math: admissions_results['2013.admissions.act_scores.midpoint.math'],
        act_scores_midpoint_writing: admissions_results['2013.admissions.act_scores.midpoint.writing'],
        sat_scores_average_overall: admissions_results['2013.admissions.sat_scores.average.overall'],
        sat_scores_average_by_ope_id: admissions_results['2013.admissions.sat_scores.average.by_ope_id']
      )
    end

    def build_aid_table(school, aid_results)
      school.create_aid(
        pell_grant_rate: aid_results['2013.aid.pell_grant_rate'],
        federal_loan_rate: aid_results['2013.aid.federal_loan_rate'],
        median_debt_completers_overall: aid_results['2013.aid.median_debt.completers.overall'],
        median_debt_income_0_30000: aid_results['2013.aid.median_debt.income.0_30000'],
        median_debt_income_30001_75000: aid_results['2013.aid.median_debt.income.30001_75000'],
        median_debt_income_greater_than_75000: aid_results['2013.aid.median_debt.income.greater_than_75000'],
        median_debt_first_generation_students: aid_results['2013.aid.median_debt.first_generation_students'],
        median_debt_non_first_generation_students: aid_results['2013.aid.median_debt.non_first_generation_students'],
        students_with_any_loan: aid_results['2013.aid.students_with_any_loan']
      )
    end

    def build_completion_table(school, completion_results)
      school.create_completion(
        completion_rate_4yr_150nt: completion_results['2013.completion.completion_rate_4yr_150nt'],
        completion_rate_less_than_4yr_150nt: completion_results['2013.completion.completion_rate_less_than_4yr_150nt'],
        title_iv_withdrawn_by_2yrs: completion_results['2013.completion.title_iv.withdrawn_by.2yrs'],
        title_iv_still_enrolled_by_2yrs: completion_results['2013.completion.title_iv.still_enrolled_by.2yrs'],
        title_iv_low_inc_still_enrolled_by_2yrs: completion_results['2013.completion.title_iv.low_inc.still_enrolled_by.2yrs'],
        title_iv_mid_inc_still_enrolled_by_2yrs: completion_results['2013.completion.title_iv.mid_inc.still_enrolled_by.2yrs'],
        title_iv_high_inc_still_enrolled_by_2yrs: completion_results['2013.completion.title_iv.high_inc.still_enrolled_by.2yrs'],
        title_iv_independ_withdrawn_by_2yrs: completion_results['2013.completion.title_iv.independ.withdrawn_by.2yrs'],
        title_iv_completed_by_4yrs: completion_results['2013.completion.title_iv.completed_by.4yrs'],
        title_iv_still_enrolled_by_4yrs: completion_results['2013.completion.title_iv.still_enrolled_by.4yrs'],
        title_iv_loan_recip_died_by_4yrs: completion_results['2013.completion.title_iv.loan_recip.died_by.4yrs'],
        title_iv_no_loan_completed_by_4yrs: completion_results['2013.completion.title_iv.no_loan.completed_by.4yrs'],
        title_iv_no_loan_withdrawn_by_4yrs: completion_results['2013.completion.title_iv.no_loan.withdrawn_by.4yrs'],
        title_iv_first_gen_died_by_4yrs: completion_results['2013.completion.title_iv.first_gen.died_by.4yrs'],
        title_iv_first_gen_completed_by_4yrs: completion_results['2013.completion.title_iv.first_gen.completed_by.4yrs'],
        title_iv_first_gen_withdrawn_by_4yrs: completion_results['2013.completion.title_iv.first_gen.withdrawn_by.4yrs'],
        title_iv_first_gen_still_enrolled_by_4yrs: completion_results['2013.completion.title_iv.first_gen.still_enrolled_by.4yrs'],
        title_iv_died_by_6yrs: completion_results['2013.completion.title_iv.died_by.6yrs'],
        title_iv_completed_by_6yrs: completion_results['2013.completion.title_iv.completed_by.6yrs'],
        title_iv_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.withdrawn_by.6yrs'],
        title_iv_low_inc_died_by_6yrs: completion_results['2013.completion.title_iv.low_inc.died_by.6yrs'],
        title_iv_low_inc_completed_by_6yrs: completion_results['2013.completion.title_iv.low_inc.completed_by.6yrs'],
        title_iv_low_inc_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.low_inc.withdrawn_by.6yrs'],
        title_iv_mid_inc_died_by_6yrs: completion_results['2013.completion.title_iv.mid_inc.died_by.6yrs'],
        title_iv_mid_inc_completed_by_6yrs: completion_results['2013.completion.title_iv.mid_inc.completed_by.6yrs'],
        title_iv_mid_inc_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.mid_inc.withdrawn_by.6yrs'],
        title_iv_high_inc_died_by_6yrs: completion_results['2013.completion.title_iv.high_inc.died_by.6yrs'],
        title_iv_high_inc_completed_by_6yrs: completion_results['2013.completion.title_iv.high_inc.completed_by.6yrs'],
        title_iv_high_inc_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.high_inc.withdrawn_by.6yrs'],
        title_iv_depend_died_by_6yrs: completion_results['2013.completion.title_iv.depend.died_by.6yrs'],
        title_iv_depend_completed_by_6yrs: completion_results['2013.completion.title_iv.depend.completed_by.6yrs'],
        title_iv_depend_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.depend.withdrawn_by.6yrs'],
        title_iv_independ_died_by_6yrs: completion_results['2013.completion.title_iv.independ.died_by.6yrs'],
        title_iv_independ_completed_by_6yrs: completion_results['2013.completion.title_iv.independ.completed_by.6yrs'],
        title_iv_independ_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.independ.withdrawn_by.6yrs'],
        title_iv_female_died_by_6yrs: completion_results['2013.completion.title_iv.female.died_by.6yrs'],
        title_iv_female_completed_by_6yrs: completion_results['2013.completion.title_iv.female.completed_by.6yrs'],
        title_iv_female_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.female.withdrawn_by.6yrs'],
        title_iv_male_died_by_6yrs: completion_results['2013.completion.title_iv.male.died_by.6yrs'],
        title_iv_male_completed_by_6yrs: completion_results['2013.completion.title_iv.male.completed_by.6yrs'],
        title_iv_male_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.male.withdrawn_by.6yrs'],
        title_iv_pell_recip_died_by_6yrs: completion_results['2013.completion.title_iv.pell_recip.died_by.6yrs'],
        title_iv_pell_recip_completed_by_6yrs: completion_results['2013.completion.title_iv.pell_recip.completed_by.6yrs'],
        title_iv_pell_recip_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.pell_recip.withdrawn_by.6yrs'],
        title_iv_no_pell_died_by_6yrs: completion_results['2013.completion.title_iv.no_pell.died_by.6yrs'],
        title_iv_no_pell_completed_by_6yrs: completion_results['2013.completion.title_iv.no_pell.completed_by.6yrs'],
        title_iv_no_pell_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.no_pell.withdrawn_by.6yrs'],
        title_iv_loan_recip_died_by_6yrs: completion_results['2013.completion.title_iv.loan_recip.died_by.6yrs'],
        title_iv_loan_recip_completed_by_6yrs: completion_results['2013.completion.title_iv.loan_recip.completed_by.6yrs'],
        title_iv_loan_recip_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.loan_recip.withdrawn_by.6yrs'],
        title_iv_no_loan_died_by_6yrs: completion_results['2013.completion.title_iv.no_loan.died_by.6yrs'],
        title_iv_no_loan_completed_by_6yrs: completion_results['2013.completion.title_iv.no_loan.completed_by.6yrs'],
        title_iv_no_loan_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.no_loan.withdrawn_by.6yrs'],
        title_iv_first_gen_died_by_6yrs: completion_results['2013.completion.title_iv.first_gen.died_by.6yrs'],
        title_iv_first_gen_completed_by_6yrs: completion_results['2013.completion.title_iv.first_gen.completed_by.6yrs'],
        title_iv_first_gen_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.first_gen.withdrawn_by.6yrs'],
        title_iv_not_first_gen_died_by_6yrs: completion_results['2013.completion.title_iv.not_first_gen.died_by.6yrs'],
        title_iv_not_first_gen_completed_by_6yrs: completion_results['2013.completion.title_iv.not_first_gen.completed_by.6yrs'],
        title_iv_not_first_gen_withdrawn_by_6yrs: completion_results['2013.completion.title_iv.not_first_gen.withdrawn_by.6yrs'],
        title_iv_died_by_8yrs: completion_results['2013.completion.title_iv.died_by.8yrs'],
        title_iv_not_first_gen_withdrawn_by_8yrs: completion_results['2013.completion.title_iv.not_first_gen.withdrawn_by.8yrs'],
        title_iv_not_first_gen_transf_withdrawn_4yr_by_8yrs: completion_results['2013.completion.title_iv.not_first_gen.transf_withdrawn_4yr_by.8yrs'],
        six_yr_completion_overall: completion_results['2013.completion.6_yr_completion.overall'],
        six_yr_completion_low_income: completion_results['2013.completion.6_yr_completion.low_income'],
        six_yr_completion_middle_income: completion_results['2013.completion.6_yr_completion.middle_income'],
        six_yr_completion_high_income: completion_results['2013.completion.6_yr_completion.high_income'],
        six_yr_completion_dependent_students: completion_results['2013.completion.6_yr_completion.dependent_students'],
        six_yr_completion_independent_students: completion_results['2013.completion.6_yr_completion.independent_students'],
        six_yr_completion_female_students: completion_results['2013.completion.6_yr_completion.female_students'],
        six_yr_completion_male_students: completion_results['2013.completion.6_yr_completion.male_students'],
        six_yr_completion_no_loan_students: completion_results['2013.completion.6_yr_completion.no_loan_students'],
        six_yr_completion_first_generation_students: completion_results['2013.completion.6_yr_completion.first_generation_students'],
        six_yr_completion_no_first_generation_students: completion_results['2013.completion.6_yr_completion.no_first_generation_students']
      )
    end

    def build_cost_table(school, cost_results)
      school.create_cost(
        avg_net_price_public: cost_results['2013.cost.avg_net_price.public'],
        avg_net_price_private: cost_results['2013.cost.avg_net_price.private'],
        avg_net_price_program_year: cost_results['2013.cost.avg_net_price.program_year'],
        avg_net_price_other_academic_year: cost_results['2013.cost.avg_net_price.other_academic_year'],
        net_price_public_by_income_level_0_30000: cost_results['2013.cost.net_price.public.by_income_level.0-30000'],
        net_price_public_by_income_level_30001_48000: cost_results['2013.cost.net_price.public.by_income_level.30001-48000'],
        net_price_public_by_income_level_48001_75000: cost_results['2013.cost.net_price.public.by_income_level.48001-75000'],
        net_price_public_by_income_level_75001_110000: cost_results['2013.cost.net_price.public.by_income_level.75001-110000'],
        net_price_public_by_income_level_110001_plus: cost_results['2013.cost.net_price.public.by_income_level.110001-plus'],
        net_price_private_by_income_level_0_30000: cost_results['2013.cost.net_price.private.by_income_level.0-30000'],
        net_price_private_by_income_level_30001_48000: cost_results['2013.cost.net_price.private.by_income_level.30001-48000'],
        net_price_private_by_income_level_48001_75000: cost_results['2013.cost.net_price.private.by_income_level.48001-75000'],
        net_price_private_by_income_level_75001_110000: cost_results['2013.cost.net_price.private.by_income_level.75001-110000'],
        net_price_private_by_income_level_110001_plus: cost_results['2013.cost.net_price.private.by_income_level.110001-plus'],
        net_price_program_reporter_by_income_level_0_30000: cost_results['2013.cost.net_price.program_reporter.by_income_level.0-30000'],
        net_price_program_reporter_by_income_level_30001_48000: cost_results['2013.cost.net_price.program_reporter.by_income_level.30001-48000'],
        net_price_program_reporter_by_income_level_48001_75000: cost_results['2013.cost.net_price.program_reporter.by_income_level.48001-75000'],
        net_price_program_reporter_by_income_level_75001_110000: cost_results['2013.cost.net_price.program_reporter.by_income_level.75001-110000'],
        net_price_program_reporter_by_income_level_110001_plus: cost_results['2013.cost.net_price.program_reporter.by_income_level.110001-plus'],
        net_price_other_acad_calendar_by_income_level_0_30000: cost_results['2013.cost.net_price.other_acad_calendar.by_income_level.0-30000'],
        net_price_other_acad_calendar_by_income_level_30001_48000: cost_results['2013.cost.net_price.other_acad_calendar.by_income_level.30001-48000'],
        net_price_other_acad_calendar_by_income_level_48001_75000: cost_results['2013.cost.net_price.other_acad_calendar.by_income_level.48001-75000'],
        net_price_other_acad_calendar_by_income_level_75001_110000: cost_results['2013.cost.net_price.other_acad_calendar.by_income_level.75001-110000'],
        net_price_other_acad_calendar_by_income_level_110001_plus: cost_results['2013.cost.net_price.other_acad_calendar.by_income_level.110001-plus'],
        title_iv_public_all: cost_results['2013.cost.title_iv.public.all'],
        title_iv_private_all: cost_results['2013.cost.title_iv.private.all'],
        attendance_academic_year: cost_results['2013.cost.attendance.academic_year'],
        attendance_program_year: cost_results['2013.cost.attendance.program_year'],
        tuition_in_state: cost_results['2013.cost.tuition.in_state'],
        tuition_out_of_state: cost_results['2013.cost.tuition.out_of_state']
      )
    end

    def build_earning_table(school, earnings_results)
      school.create_earning(
        ten_yrs_after_entry_not_working_not_enrolled_overall: earnings_results['2013.earnings.10_yrs_after_entry.not_working_not_enrolled.overall'],
        ten_yrs_after_entry_working_not_enrolled_overall: earnings_results['2013.earnings.10_yrs_after_entry.working_not_enrolled.overall'],
        ten_yrs_after_entry_working_not_enrolled_mean_earnings: earnings_results['2013.earnings.10_yrs_after_entry.working_not_enrolled.mean_earnings'],
        ten_yrs_after_entry_median: earnings_results['2013.earnings.10_yrs_after_entry.median'],
        ten_yrs_after_entry_working_not_enrolled_earnings_percentile_te: earnings_results['2013.earnings.10_yrs_after_entry.working_not_enrolled.earnings_percentile.10'],
        ten_yrs_after_entry_working_not_enrolled_earnings_percentile_25: earnings_results['2013.earnings.10_yrs_after_entry.working_not_enrolled.earnings_percentile.25'],
        ten_yrs_after_entry_working_not_enrolled_earnings_percentile_75: earnings_results['2013.earnings.10_yrs_after_entry.working_not_enrolled.earnings_percentile.75'],
        ten_yrs_after_entry_working_not_enrolled_earnings_percentile_90: earnings_results['2013.earnings.10_yrs_after_entry.working_not_enrolled.earnings_percentile.90'],
        ten_yrs_after_entry_percent_greater_than_25000: earnings_results['2013.earnings.10_yrs_after_entry.percent_greater_than_25000'],
        ten_yrs_after_entry_mean_earnings_lowest_tercile: earnings_results['2013.earnings.10_yrs_after_entry.mean_earnings.lowest_tercile'],
        ten_yrs_after_entry_mean_earnings_middle_tercile: earnings_results['2013.earnings.10_yrs_after_entry.mean_earnings.middle_tercile'],
        ten_yrs_after_entry_mean_earnings_highest_tercile: earnings_results['2013.earnings.10_yrs_after_entry.mean_earnings.highest_tercile'],
        six_yrs_after_entry_working_not_enrolled_mean_earnings: earnings_results['2013.earnings.6_yrs_after_entry.working_not_enrolled.mean_earnings'],
        six_yrs_after_entry_median: earnings_results['2013.earnings.6_yrs_after_entry.median'],
        six_yrs_after_entry_working_not_enrolled_earnings_percentile_te: earnings_results['2013.earnings.6_yrs_after_entry.working_not_enrolled.earnings_percentile.10']

      )
    end

    def build_repayment_table(school, repayment_results)
      school.create_repayment(
        one_yr_repayment_completers: repayment_results['2013.repayment.1_yr_repayment.completers'],
        three_yr_repayment_completers: repayment_results['2013.repayment.3_yr_repayment.completers'],
        three_yr_repayment_income_0_30000: repayment_results['2013.repayment.3_yr_repayment.income.0_30000'],
        three_yr_repayment_income_30000_75000: repayment_results['2013.repayment.3_yr_repayment.income.30000_75000'],
        three_yr_repayment_income_greater_than_75000: repayment_results['2013.repayment.3_yr_repayment.income.greater_than_75000'],
        five_yr_repayment_pell_grant: repayment_results['2013.repayment.5_yr_repayment.pell_grant'],
        seven_yr_repayment_overall: repayment_results['2013.repayment.7_yr_repayment.overall'],
        seven_yr_repayment_completers: repayment_results['2013.repayment.7_yr_repayment.completers']
      )
    end

    def build_student_table(school, student_results)
      school.create_student(
        size: student_results['2013.student.size'],
        enrollment_all: student_results['2013.enrollment.all'],
        demographics_race_ethnicity_white: student_results['2013.student.demographics.race_ethnicity.white'],
        demographics_race_ethnicity_black: student_results['2013.student.demographics.race_ethnicity.black'],
        demographics_race_ethnicity_hispanic: student_results['2013.student.demographics.race_ethnicity.hispanic'],
        demographics_race_ethnicity_asian: student_results['2013.student.demographics.race_ethnicity.asian'],
        demographics_race_ethnicity_aian: student_results['2013.student.demographics.race_ethnicity.aian'],
        demographics_race_ethnicity_nhpi: student_results['2013.student.demographics.race_ethnicity.nhpi'],
        demographics_race_ethnicity_two_or_more: student_results['2013.student.demographics.race_ethnicity.two_or_more'],
        demographics_race_ethnicity_non_resident_alien: student_results['2013.student.demographics.race_ethnicity.non_resident_alien'],
        demographics_race_ethnicity_unknown: student_results['2013.student.demographics.race_ethnicity.unknown'],
        demographics_race_ethnicity_white_non_hispanic: student_results['2013.student.demographics.race_ethnicity.white_non_hispanic'],
        demographics_race_ethnicity_black_non_hispanic: student_results['2013.student.demographics.race_ethnicity.black_non_hispanic'],
        demographics_race_ethnicity_asian_pacific_islander: student_results['2013.student.demographics.race_ethnicity.asian_pacific_islander'],
        demographics_race_ethnicity_aian_prior_2009: student_results['2013.student.demographics.race_ethnicity.aian_prior_2009'],
        demographics_race_ethnicity_hispanic_prior_2009: student_results['2013.student.demographics.race_ethnicity.hispanic_prior_2009'],
        share_first_time_full_time: student_results['2013.student.share_first.time_full.time'],
        share_25_older: student_results['2013.student.share_25_older'],
        share_independent_students: student_results['2013.student.share_independent_students'],
        share_independent_lowincome_0_30000: student_results['2013.student.share_independent_lowincome.0_30000'],
        share_dependent_lowincome_0_300000: student_results['2013.student.share_dependent_lowincome.0_300000'],
        share_firstgeneration: student_results['2013.student.share_firstgeneration'],
        share_middleincome_30001_48000: student_results['2013.student.share_middleincome.30001_48000'],
        share_highincome_75001_110000: student_results['2013.student.share_highincome.75001_110000'],
        share_highincome_110001plus: student_results['2013.student.share_highincome.110001plus'],
        share_dependent_middleincome_300001_48000: student_results['2013.student.share_dependent_middleincome.300001_48000'],
        share_firstgeneration_parents_middleschool: student_results['2013.student.share_firstgeneration_parents.middleschool'],
        share_firstgeneration_parents_highschool: student_results['2013.student.share_firstgeneration_parents.highschool'],
        share_firstgeneration_parents_somecollege: student_results['2013.student.share_firstgeneration_parents.somecollege'],
        family_income_overall: student_results['2013.student.family_income.overall'],
        parents_education_level: student_results['2013.student.parents_education_level'],
        FAFSA_applications: student_results['2013.student.FAFSA_applications'],
        demographics_age_entry: student_results['2013.student.demographics.age_entry'],
        demographics_over_23_at_entry: student_results['2013.student.demographics.over_23_at_entry'],
        demographics_married: student_results['2013.student.demographics.married'],
        demographics_dependent: student_results['2013.student.demographics.dependent'],
        demographics_avg_family_income: student_results['2013.student.demographics.avg_family_income'],
        demographics_median_family_income: student_results['2013.student.demographics.median_family_income'],
        demographics_median_hh_income: student_results['2013.student.demographics.median_hh_income'],
        demographics_poverty_rate: student_results['2013.student.demographics.poverty_rate'],
        demographics_unemployment: student_results['2013.student.demographics.unemployment']
      )
    end
  end
end

# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160825190215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academics", force: :cascade do |t|
    t.integer  "school_id"
    t.float    "program_percentage_agriculture"
    t.float    "program_percentage_resources"
    t.float    "program_percentage_architecture"
    t.float    "program_percentage_ethnic_cultural_gender"
    t.float    "program_percentage_communication"
    t.float    "program_percentage_communications_technology"
    t.float    "program_percentage_computer"
    t.float    "program_percentage_personal_culinary"
    t.float    "program_percentage_education"
    t.float    "program_percentage_engineering"
    t.float    "program_percentage_engineering_technology"
    t.float    "program_percentage_language"
    t.float    "program_percentage_family_consumer_science"
    t.float    "program_percentage_legal"
    t.float    "program_percentage_english"
    t.float    "program_percentage_humanities"
    t.float    "program_percentage_library"
    t.float    "program_percentage_biological"
    t.float    "program_percentage_mathematics"
    t.float    "program_percentage_military"
    t.float    "program_percentage_multidiscipline"
    t.float    "program_percentage_parks_recreation_fitness"
    t.float    "program_percentage_philosophy_religious"
    t.float    "program_percentage_theology_religious_vocation"
    t.float    "program_percentage_physical_science"
    t.float    "program_percentage_science_technology"
    t.float    "program_percentage_psychology"
    t.float    "program_percentage_security_law_enforcement"
    t.float    "program_percentage_public_administration_social_service"
    t.float    "program_percentage_social_science"
    t.float    "program_percentage_construction"
    t.float    "program_percentage_mechanic_repair_technology"
    t.float    "program_percentage_precision_production"
    t.float    "program_percentage_transportation"
    t.float    "program_percentage_visual_performing"
    t.float    "program_percentage_health"
    t.float    "program_percentage_business_marketing"
    t.float    "program_percentage_history"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  create_table "admissions", force: :cascade do |t|
    t.integer  "school_id"
    t.float    "program_percentage_history"
    t.float    "admission_rate_overall"
    t.float    "admission_rate_by_ope_id"
    t.float    "sat_scores_25th_percentile_critical_reading"
    t.float    "sat_scores_75th_percentile_critical_reading"
    t.float    "sat_scores_25th_percentile_math"
    t.float    "sat_scores_75th_percentile_math"
    t.float    "sat_scores_25th_percentile_writing"
    t.float    "sat_scores_75th_percentile_writing"
    t.float    "sat_scores_midpoint_critical_reading"
    t.float    "sat_scores_midpoint_math"
    t.float    "sat_scores_midpoint_writing"
    t.float    "act_scores_25th_percentile_cumulative"
    t.float    "act_scores_75th_percentile_cumulative"
    t.float    "act_scores_25th_percentile_english"
    t.float    "act_scores_75th_percentile_english"
    t.float    "act_scores_25th_percentile_math"
    t.float    "act_scores_75th_percentile_math"
    t.float    "act_scores_25th_percentile_writing"
    t.float    "act_scores_75th_percentile_writing"
    t.float    "act_scores_midpoint_cumulative"
    t.float    "act_scores_midpoint_english"
    t.float    "act_scores_midpoint_math"
    t.float    "act_scores_midpoint_writing"
    t.float    "sat_scores_average_overall"
    t.float    "sat_scores_average_by_ope_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "aids", force: :cascade do |t|
    t.integer  "school_id"
    t.float    "pell_grant_rate"
    t.float    "federal_loan_rate"
    t.float    "median_debt_completers_overall"
    t.float    "median_debt_income_0_30000"
    t.float    "median_debt_income_30001_75000"
    t.float    "median_debt_income_greater_than_75000"
    t.float    "median_debt_first_generation_students"
    t.float    "median_debt_non_first_generation_students"
    t.float    "students_with_any_loan"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "essay"
    t.boolean  "letters"
    t.boolean  "application"
  end

  add_index "bookmarks", ["school_id", "user_id"], name: "index_bookmarks_on_school_id_and_user_id", unique: true, using: :btree

  create_table "completions", force: :cascade do |t|
    t.integer  "school_id"
    t.float    "completion_rate_4yr_150nt"
    t.float    "completion_rate_less_than_4yr_150nt"
    t.float    "title_iv_withdrawn_by_2yrs"
    t.float    "title_iv_still_enrolled_by_2yrs"
    t.float    "title_iv_low_inc_still_enrolled_by_2yrs"
    t.float    "title_iv_mid_inc_still_enrolled_by_2yrs"
    t.float    "title_iv_high_inc_still_enrolled_by_2yrs"
    t.float    "title_iv_independ_withdrawn_by_2yrs"
    t.float    "title_iv_completed_by_4yrs"
    t.float    "title_iv_still_enrolled_by_4yrs"
    t.float    "title_iv_loan_recip_died_by_4yrs"
    t.float    "title_iv_no_loan_completed_by_4yrs"
    t.float    "title_iv_no_loan_withdrawn_by_4yrs"
    t.float    "title_iv_first_gen_died_by_4yrs"
    t.float    "title_iv_first_gen_completed_by_4yrs"
    t.float    "title_iv_first_gen_withdrawn_by_4yrs"
    t.float    "title_iv_first_gen_still_enrolled_by_4yrs"
    t.float    "title_iv_died_by_6yrs"
    t.float    "title_iv_completed_by_6yrs"
    t.float    "title_iv_withdrawn_by_6yrs"
    t.float    "title_iv_low_inc_died_by_6yrs"
    t.float    "title_iv_low_inc_completed_by_6yrs"
    t.float    "title_iv_low_inc_withdrawn_by_6yrs"
    t.float    "title_iv_mid_inc_died_by_6yrs"
    t.float    "title_iv_mid_inc_completed_by_6yrs"
    t.float    "title_iv_mid_inc_withdrawn_by_6yrs"
    t.float    "title_iv_high_inc_died_by_6yrs"
    t.float    "title_iv_high_inc_completed_by_6yrs"
    t.float    "title_iv_high_inc_withdrawn_by_6yrs"
    t.float    "title_iv_depend_died_by_6yrs"
    t.float    "title_iv_depend_completed_by_6yrs"
    t.float    "title_iv_depend_withdrawn_by_6yrs"
    t.float    "title_iv_independ_died_by_6yrs"
    t.float    "title_iv_independ_completed_by_6yrs"
    t.float    "title_iv_independ_withdrawn_by_6yrs"
    t.float    "title_iv_female_died_by_6yrs"
    t.float    "title_iv_female_completed_by_6yrs"
    t.float    "title_iv_female_withdrawn_by_6yrs"
    t.float    "title_iv_male_died_by_6yrs"
    t.float    "title_iv_male_completed_by_6yrs"
    t.float    "title_iv_male_withdrawn_by_6yrs"
    t.float    "title_iv_pell_recip_died_by_6yrs"
    t.float    "title_iv_pell_recip_completed_by_6yrs"
    t.float    "title_iv_pell_recip_withdrawn_by_6yrs"
    t.float    "title_iv_no_pell_died_by_6yrs"
    t.float    "title_iv_no_pell_completed_by_6yrs"
    t.float    "title_iv_no_pell_withdrawn_by_6yrs"
    t.float    "title_iv_loan_recip_died_by_6yrs"
    t.float    "title_iv_loan_recip_completed_by_6yrs"
    t.float    "title_iv_loan_recip_withdrawn_by_6yrs"
    t.float    "title_iv_no_loan_died_by_6yrs"
    t.float    "title_iv_no_loan_completed_by_6yrs"
    t.float    "title_iv_no_loan_withdrawn_by_6yrs"
    t.float    "title_iv_first_gen_died_by_6yrs"
    t.float    "title_iv_first_gen_completed_by_6yrs"
    t.float    "title_iv_first_gen_withdrawn_by_6yrs"
    t.float    "title_iv_not_first_gen_died_by_6yrs"
    t.float    "title_iv_not_first_gen_completed_by_6yrs"
    t.float    "title_iv_not_first_gen_withdrawn_by_6yrs"
    t.float    "title_iv_died_by_8yrs"
    t.float    "title_iv_not_first_gen_withdrawn_by_8yrs"
    t.float    "title_iv_not_first_gen_transf_withdrawn_4yr_by_8yrs"
    t.integer  "six_yr_completion_overall"
    t.integer  "six_yr_completion_low_income"
    t.integer  "six_yr_completion_middle_income"
    t.integer  "six_yr_completion_high_income"
    t.integer  "six_yr_completion_dependent_students"
    t.integer  "six_yr_completion_independent_students"
    t.integer  "six_yr_completion_female_students"
    t.integer  "six_yr_completion_male_students"
    t.integer  "six_yr_completion_no_loan_students"
    t.integer  "six_yr_completion_first_generation_students"
    t.integer  "six_yr_completion_no_first_generation_students"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "costs", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "avg_net_price_public"
    t.integer  "avg_net_price_private"
    t.integer  "avg_net_price_program_year"
    t.integer  "avg_net_price_other_academic_year"
    t.integer  "net_price_public_by_income_level_0_30000"
    t.integer  "net_price_public_by_income_level_30001_48000"
    t.integer  "net_price_public_by_income_level_48001_75000"
    t.integer  "net_price_public_by_income_level_75001_110000"
    t.integer  "net_price_public_by_income_level_110001_plus"
    t.integer  "net_price_private_by_income_level_0_30000"
    t.integer  "net_price_private_by_income_level_30001_48000"
    t.integer  "net_price_private_by_income_level_48001_75000"
    t.integer  "net_price_private_by_income_level_75001_110000"
    t.integer  "net_price_private_by_income_level_110001_plus"
    t.integer  "net_price_program_reporter_by_income_level_0_30000"
    t.integer  "net_price_program_reporter_by_income_level_30001_48000"
    t.integer  "net_price_program_reporter_by_income_level_48001_75000"
    t.integer  "net_price_program_reporter_by_income_level_75001_110000"
    t.integer  "net_price_program_reporter_by_income_level_110001_plus"
    t.integer  "net_price_other_acad_calendar_by_income_level_0_30000"
    t.integer  "net_price_other_acad_calendar_by_income_level_30001_48000"
    t.integer  "net_price_other_acad_calendar_by_income_level_48001_75000"
    t.integer  "net_price_other_acad_calendar_by_income_level_75001_110000"
    t.integer  "net_price_other_acad_calendar_by_income_level_110001_plus"
    t.integer  "title_iv_public_all"
    t.integer  "title_iv_private_all"
    t.integer  "attendance_academic_year"
    t.integer  "attendance_program_year"
    t.integer  "tuition_in_state"
    t.integer  "tuition_out_of_state"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  create_table "earnings", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "ten_yrs_after_entry_not_working_not_enrolled_overall"
    t.integer  "ten_yrs_after_entry_working_not_enrolled_overall"
    t.integer  "ten_yrs_after_entry_working_not_enrolled_mean_earnings"
    t.integer  "ten_yrs_after_entry_median"
    t.integer  "ten_yrs_after_entry_working_not_enrolled_earnings_percentile_te"
    t.integer  "ten_yrs_after_entry_working_not_enrolled_earnings_percentile_25"
    t.integer  "ten_yrs_after_entry_working_not_enrolled_earnings_percentile_75"
    t.integer  "ten_yrs_after_entry_working_not_enrolled_earnings_percentile_90"
    t.float    "ten_yrs_after_entry_percent_greater_than_25000"
    t.integer  "ten_yrs_after_entry_mean_earnings_lowest_tercile"
    t.integer  "ten_yrs_after_entry_mean_earnings_middle_tercile"
    t.integer  "ten_yrs_after_entry_mean_earnings_highest_tercile"
    t.integer  "six_yrs_after_entry_working_not_enrolled_mean_earnings"
    t.integer  "six_yrs_after_entry_median"
    t.integer  "six_yrs_after_entry_working_not_enrolled_earnings_percentile_te"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  create_table "repayments", force: :cascade do |t|
    t.integer  "school_id"
    t.float    "one_yr_repayment_completers"
    t.float    "three_yr_repayment_completers"
    t.float    "three_yr_repayment_income_0_30000"
    t.float    "three_yr_repayment_income_30000_75000"
    t.float    "three_yr_repayment_income_greater_than_75000"
    t.integer  "five_yr_repayment_pell_grant"
    t.integer  "seven_yr_repayment_overall"
    t.integer  "seven_yr_repayment_completers"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "school_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["school_id"], name: "index_reviews_on_school_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "school_name"
    t.string   "school_city"
    t.float    "root_location_lat"
    t.float    "root_location_lon"
    t.string   "school_state"
    t.string   "school_school_url"
    t.string   "school_price_calculator_url"
    t.integer  "school_state_fips"
    t.integer  "school_region_id"
    t.integer  "school_locale"
    t.integer  "school_ownership"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "school_under_investigation"
  end

  create_table "students", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "size"
    t.integer  "enrollment_all"
    t.float    "demographics_race_ethnicity_white"
    t.float    "demographics_race_ethnicity_black"
    t.float    "demographics_race_ethnicity_hispanic"
    t.float    "demographics_race_ethnicity_asian"
    t.float    "demographics_race_ethnicity_aian"
    t.float    "demographics_race_ethnicity_nhpi"
    t.float    "demographics_race_ethnicity_two_or_more"
    t.float    "demographics_race_ethnicity_non_resident_alien"
    t.float    "demographics_race_ethnicity_unknown"
    t.float    "demographics_race_ethnicity_white_non_hispanic"
    t.float    "demographics_race_ethnicity_black_non_hispanic"
    t.float    "demographics_race_ethnicity_asian_pacific_islander"
    t.float    "demographics_race_ethnicity_aian_prior_2009"
    t.float    "demographics_race_ethnicity_hispanic_prior_2009"
    t.float    "share_first_time_full_time"
    t.float    "share_25_older"
    t.float    "share_independent_students"
    t.float    "share_independent_lowincome_0_30000"
    t.float    "share_dependent_lowincome_0_300000"
    t.float    "share_firstgeneration"
    t.float    "share_middleincome_30001_48000"
    t.float    "share_highincome_75001_110000"
    t.float    "share_highincome_110001plus"
    t.float    "share_dependent_middleincome_300001_48000"
    t.float    "share_firstgeneration_parents_middleschool"
    t.float    "share_firstgeneration_parents_highschool"
    t.float    "share_firstgeneration_parents_somecollege"
    t.integer  "family_income_overall"
    t.integer  "parents_education_level"
    t.integer  "FAFSA_applications"
    t.integer  "demographics_age_entry"
    t.float    "demographics_over_23_at_entry"
    t.float    "demographics_married"
    t.float    "demographics_dependent"
    t.integer  "demographics_avg_family_income"
    t.integer  "demographics_median_family_income"
    t.integer  "demographics_median_hh_income"
    t.float    "demographics_poverty_rate"
    t.float    "demographics_unemployment"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end

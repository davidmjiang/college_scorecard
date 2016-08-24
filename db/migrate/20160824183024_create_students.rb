class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :school_id
      t.integer :size
      t.integer :enrollment_all
      t.float :demographics_race_ethnicity_white
      t.float :demographics_race_ethnicity_black
      t.float :demographics_race_ethnicity_hispanic
      t.float :demographics_race_ethnicity_asian
      t.float :demographics_race_ethnicity_aian
      t.float :demographics_race_ethnicity_nhpi
      t.float :demographics_race_ethnicity_two_or_more
      t.float :demographics_race_ethnicity_non_resident_alien
      t.float :demographics_race_ethnicity_unknown
      t.float :demographics_race_ethnicity_white_non_hispanic
      t.float :demographics_race_ethnicity_black_non_hispanic
      t.float :demographics_race_ethnicity_asian_pacific_islander
      t.float :demographics_race_ethnicity_aian_prior_2009
      t.float :demographics_race_ethnicity_hispanic_prior_2009
      t.float :share_first_time_full_time
      t.float :share_25_older
      t.float :share_independent_students
      t.float :share_independent_lowincome_0_30000
      t.float :share_dependent_lowincome_0_300000
      t.float :share_firstgeneration
      t.float :share_middleincome_30001_48000
      t.float :share_middleincome_30001_48000
      t.float :share_highincome_75001_110000
      t.float :share_highincome_110001plus
      t.float :share_dependent_middleincome_300001_48000
      t.float :share_firstgeneration_parents_middleschool
      t.float :share_firstgeneration_parents_highschool
      t.float :share_firstgeneration_parents_somecollege
      t.integer :family_income_overall
      t.integer :parents_education_level
      t.integer :FAFSA_applications
      t.integer :demographics_age_entry
      t.float :demographics_over_23_at_entry
      t.float :demographics_married
      t.float :demographics_dependent
      t.integer :demographics_avg_family_income
      t.integer :demographics_median_family_income
      t.integer :demographics_median_hh_income
      t.float :demographics_poverty_rate
      t.float :demographics_unemployment
      t.timestamps null: false
    end
  end
end

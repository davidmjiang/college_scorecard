class CreateEarnings < ActiveRecord::Migration
  def change
    create_table :earnings do |t|
      t.integer :school_id
      t.integer :ten_yrs_after_entry_not_working_not_enrolled_overall
      t.integer :ten_yrs_after_entry_working_not_enrolled_overall
      t.integer :ten_yrs_after_entry_working_not_enrolled_mean_earnings
      t.integer :ten_yrs_after_entry_median
      t.integer :ten_yrs_after_entry_working_not_enrolled_earnings_percentile_ten
      t.integer :ten_yrs_after_entry_working_not_enrolled_earnings_percentile_25
      t.integer :ten_yrs_after_entry_working_not_enrolled_earnings_percentile_75
      t.integer :ten_yrs_after_entry_working_not_enrolled_earnings_percentile_90
      t.float :ten_yrs_after_entry_percent_greater_than_25000
      t.integer :ten_yrs_after_entry_mean_earnings_lowest_tercile
      t.integer :ten_yrs_after_entry_mean_earnings_middle_tercile
      t.integer :ten_yrs_after_entry_mean_earnings_highest_tercile
      t.integer :six_yrs_after_entry_working_not_enrolled_mean_earnings
      t.integer :six_yrs_after_entry_median
      t.integer :six_yrs_after_entry_working_not_enrolled_earnings_percentile_ten
      t.timestamps null: false
    end
  end
end

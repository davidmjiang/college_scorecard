class CreateAdmissions < ActiveRecord::Migration
  def change
    create_table :admissions do |t|
      t.integer :school_id
      t.float :program_percentage_history
      t.float :admission_rate_overall
      t.float :admission_rate_by_ope_id
      t.float :sat_scores_25th_percentile_critical_reading
      t.float :sat_scores_75th_percentile_critical_reading
      t.float :sat_scores_25th_percentile_math
      t.float :sat_scores_75th_percentile_math
      t.float :sat_scores_25th_percentile_writing
      t.float :sat_scores_75th_percentile_writing
      t.float :sat_scores_midpoint_critical_reading
      t.float :sat_scores_midpoint_math
      t.float :sat_scores_midpoint_writing
      t.float :act_scores_25th_percentile_cumulative
      t.float :act_scores_75th_percentile_cumulative
      t.float :act_scores_25th_percentile_english
      t.float :act_scores_75th_percentile_english
      t.float :act_scores_25th_percentile_math
      t.float :act_scores_75th_percentile_math
      t.float :act_scores_25th_percentile_writing
      t.float :act_scores_75th_percentile_writing
      t.float :act_scores_midpoint_cumulative
      t.float :act_scores_midpoint_english
      t.float :act_scores_midpoint_math
      t.float :act_scores_midpoint_writing
      t.float :sat_scores_average_overall
      t.float :sat_scores_average_by_ope_id
      t.timestamps null: false
    end
  end
end

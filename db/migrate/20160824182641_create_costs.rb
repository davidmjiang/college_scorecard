class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.integer :school_id
      t.integer :avg_net_price_public
      t.integer :avg_net_price_private
      t.integer :avg_net_price_program_year
      t.integer :avg_net_price_other_academic_year
      t.integer :net_price_public_by_income_level_0_30000
      t.integer :net_price_public_by_income_level_30001_48000
      t.integer :net_price_public_by_income_level_48001_75000
      t.integer :net_price_public_by_income_level_75001_110000
      t.integer :net_price_public_by_income_level_110001_plus
      t.integer :net_price_private_by_income_level_0_30000
      t.integer :net_price_private_by_income_level_30001_48000
      t.integer :net_price_private_by_income_level_48001_75000
      t.integer :net_price_private_by_income_level_75001_110000
      t.integer :net_price_private_by_income_level_110001_plus
      t.integer :net_price_program_reporter_by_income_level_0_30000
      t.integer :net_price_program_reporter_by_income_level_30001_48000
      t.integer :net_price_program_reporter_by_income_level_48001_75000
      t.integer :net_price_program_reporter_by_income_level_75001_110000
      t.integer :net_price_program_reporter_by_income_level_110001_plus
      t.integer :net_price_other_acad_calendar_by_income_level_0_30000
      t.integer :net_price_other_acad_calendar_by_income_level_30001_48000
      t.integer :net_price_other_acad_calendar_by_income_level_48001_75000
      t.integer :net_price_other_acad_calendar_by_income_level_75001_110000
      t.integer :net_price_other_acad_calendar_by_income_level_110001_plus
      t.integer :title_iv_public_all
      t.integer :title_iv_private_all
      t.integer :attendance_academic_year
      t.integer :attendance_program_year
      t.integer :tuition_in_state
      t.integer :tuition_out_of_state
      t.timestamps null: false
    end
  end
end

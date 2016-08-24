class CreateAids < ActiveRecord::Migration
  def change
    create_table :aids do |t|
      t.integer :school_id
      t.float :pell_grant_rate
      t.float :federal_loan_rate
      t.float :median_debt_completers_overall
      t.float :median_debt_income_0_30000
      t.float :median_debt_income_30001_75000
      t.float :median_debt_income_greater_than_75000
      t.float :median_debt_first_generation_students
      t.float :median_debt_non_first_generation_students
      t.float :students_with_any_loan
      t.timestamps null: false
    end
  end
end

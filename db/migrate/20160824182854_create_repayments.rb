class CreateRepayments < ActiveRecord::Migration
  def change
    create_table :repayments do |t|
      t.integer :school_id
      t.float :one_yr_repayment_completers
      t.float :three_yr_repayment_completers
      t.float :three_yr_repayment_income_0_30000
      t.float :three_yr_repayment_income_30000_75000
      t.float :three_yr_repayment_income_greater_than_75000
      t.integer :five_yr_repayment_pell_grant
      t.integer :seven_yr_repayment_overall
      t.integer :seven_yr_repayment_completers
      t.timestamps null: false
    end
  end
end

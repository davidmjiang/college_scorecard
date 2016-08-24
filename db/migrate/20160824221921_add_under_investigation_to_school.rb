class AddUnderInvestigationToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :school_under_investigation, :integer
  end
end

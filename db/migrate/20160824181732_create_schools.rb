class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :school_city
      t.float :root_location_lat
      t.float :root_location_lon
      t.string :school_state
      t.string :school_school_url
      t.string :school_price_calculator_url
      t.integer :school_state_fips
      t.integer :school_region_id
      t.integer :school_locale
      t.integer :school_ownership
      t.timestamps null: false
    end
  end
end

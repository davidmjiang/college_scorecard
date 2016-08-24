class CreateAcademics < ActiveRecord::Migration
  def change
    create_table :academics do |t|
      t.integer :school_id
      t.float :program_percentage_agriculture
      t.float :program_percentage_resources
      t.float :program_percentage_architecture
      t.float :program_percentage_ethnic_cultural_gender
      t.float :program_percentage_communication
      t.float :program_percentage_communications_technology
      t.float :program_percentage_computer
      t.float :program_percentage_personal_culinary
      t.float :program_percentage_education
      t.float :program_percentage_engineering
      t.float :program_percentage_engineering_technology
      t.float :program_percentage_language
      t.float :program_percentage_family_consumer_science
      t.float :program_percentage_legal
      t.float :program_percentage_english
      t.float :program_percentage_humanities
      t.float :program_percentage_library
      t.float :program_percentage_biological
      t.float :program_percentage_mathematics
      t.float :program_percentage_military
      t.float :program_percentage_multidiscipline
      t.float :program_percentage_parks_recreation_fitness
      t.float :program_percentage_philosophy_religious
      t.float :program_percentage_theology_religious_vocation
      t.float :program_percentage_physical_science
      t.float :program_percentage_science_technology
      t.float :program_percentage_psychology
      t.float :program_percentage_security_law_enforcement
      t.float :program_percentage_public_administration_social_service
      t.float :program_percentage_social_science
      t.float :program_percentage_construction
      t.float :program_percentage_mechanic_repair_technology
      t.float :program_percentage_precision_production
      t.float :program_percentage_transportation
      t.float :program_percentage_visual_performing
      t.float :program_percentage_health
      t.float :program_percentage_business_marketing
      t.float :program_percentage_history
      t.timestamps null: false
    end
  end
end

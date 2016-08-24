class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer :user_id
    	t.integer :school_id
    	t.text :body
      t.timestamps null: false
    end

    add_index :reviews, :user_id
    add_index :reviews, :school_id
  end
end

class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
    	t.integer :school_id
    	t.integer :user_id
      t.timestamps null: false
    end

    add_index :bookmarks, [ :school_id, :user_id ], unique: true
    
  end
end

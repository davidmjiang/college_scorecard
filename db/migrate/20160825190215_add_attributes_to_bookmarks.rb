class AddAttributesToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :essay, :boolean
    add_column :bookmarks, :letters, :boolean
    add_column :bookmarks, :application, :boolean
  end
end

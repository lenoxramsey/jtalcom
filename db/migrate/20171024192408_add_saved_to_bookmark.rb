class AddSavedToBookmark < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :saved, :boolean
  end
end

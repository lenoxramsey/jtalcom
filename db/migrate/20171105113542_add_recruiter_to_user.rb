class AddRecruiterToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :recruiter, :boolean
  end
end

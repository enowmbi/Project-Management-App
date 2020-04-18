class RemoveProjectsCountFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :projects_count,:integer
  end
end

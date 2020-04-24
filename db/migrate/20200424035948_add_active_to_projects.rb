class AddActiveToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :active, :boolean, default: true
  end
end

class AddProjectIdToIssues < ActiveRecord::Migration[5.2]
  def change
    add_reference :issues, :project, foreign_key: true
  end
end

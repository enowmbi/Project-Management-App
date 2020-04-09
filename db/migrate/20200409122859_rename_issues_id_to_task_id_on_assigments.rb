class RenameIssuesIdToTaskIdOnAssigments < ActiveRecord::Migration[6.0]
  def change
    rename_column :assignments,:issue_id, :task_id
  end
end

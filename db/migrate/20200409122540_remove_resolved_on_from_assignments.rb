class RemoveResolvedOnFromAssignments < ActiveRecord::Migration[6.0]
  def change
    remove_column :assignments, :resolved_on
  end
end

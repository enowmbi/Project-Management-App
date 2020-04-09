class ChangeTaskSeverityToPriority < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks,:severity, :priority
  end
end

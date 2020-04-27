class RenameDescriptionToOldDescriptionInTasks < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :description, :old_description
  end
end

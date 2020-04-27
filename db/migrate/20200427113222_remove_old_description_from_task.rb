class RemoveOldDescriptionFromTask < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :old_description, :text
  end
end

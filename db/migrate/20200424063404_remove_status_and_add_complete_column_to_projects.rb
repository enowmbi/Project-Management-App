class ChangeStatusToComplete < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :status,:string
    add_column :projects, :complete, :boolean, default: false
  end
end

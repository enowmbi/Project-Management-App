class AddDueDateToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :due_date, :date, default: Date.today,null: false
  end
end

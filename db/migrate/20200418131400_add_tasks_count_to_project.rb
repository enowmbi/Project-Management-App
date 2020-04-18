class AddTasksCountToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :tasks_count, :integer, default: 0, null: false

    up_only do 
      Project.find_each{|project| Project.reset_counters(project.id,:tasks)}
    end
  end
end

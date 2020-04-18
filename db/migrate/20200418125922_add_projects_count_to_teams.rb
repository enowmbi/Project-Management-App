class AddProjectsCountToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :projects_count, :integer,default: 0, null: false

    up_only do 
      Team.find_each{|team| Team.reset_counters(team.id,:projects)}
    end
  end
end

class AddProjectsCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :projects_count, :integer,default: 0, null: false

    up_only do 
      User.find_each{|u| User.reset_counters(u.id,:projects)}
    end
  end
end

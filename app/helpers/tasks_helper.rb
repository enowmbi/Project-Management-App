module TasksHelper
  TASK_PRIORITIES = ['High','Medium','Low']

  sortables = %w(title priority complete)

  sortables.each do |sortable|
    define_method "sort_by_#{sortable}_asc" do 
      # link_to("<i class='fas fa-sort-up'></i>".html_safe,"/teams/params[:team_id]/sort_by_#{sortable}_asc_team_project_tasks_path(params[:team_id],params[:project_id])".html_safe) 
    end

    define_method "sort_by_#{sortable}_desc" do 
      # link_to("<i class='fas fa-sort-down'></i>".html_safe,"sort_by_#{sortable}_asc_team_project_tasks_path(#{sort_params})".html_safe) 
    end
  end

end

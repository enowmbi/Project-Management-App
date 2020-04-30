module TasksHelper
  TASK_PRIORITIES = ['High','Medium','Low']

  sortables = %w(title priority status)

  sortables.each do |sortable|
    define_method "sort_by_#{sortable}_asc" do |team,project| 
      link_to("<i class='fas fa-sort-up'></i>".html_safe,"/teams/#{team}/projects/#{project}/tasks/sort_by_#{sortable}_asc".html_safe) 
    end
    define_method "sort_by_#{sortable}_desc" do |team,project| 
      link_to("<i class='fas fa-sort-down'></i>".html_safe,"/teams/#{team}/projects/#{project}/tasks/sort_by_#{sortable}_desc".html_safe) 
    end
  end

end

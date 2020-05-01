module ProjectsHelper
  def project_activity(project)
    project.active? ? 'Active' : 'Inactive'
  end

  def project_status(project)
    project.complete? ? 'Complete' : 'Incomplete'
  end

  sortables = %w(name due_date active complete)

  sortables.each do |sortable| 
    define_method "sort_by_project_#{sortable}_asc" do |team|
      link_to("<i class='fas fa-sort-up'></i>".html_safe, "/teams/#{team}/projects/sort_by_#{sortable}_asc".html_safe) 
    end

    define_method "sort_by_project_#{sortable}_desc" do |team|
      link_to("<i class='fas fa-sort-down'></i>".html_safe, "/teams/#{team}/projects/sort_by_#{sortable}_desc".html_safe) 
    end
  end

end

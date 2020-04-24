module ProjectsHelper
  def project_activity(project)
     project.active? ? 'Active' : 'Inactive'
  end

  def project_status(project)
     project.complete? ? 'Complete' : 'Incomplete'
  end
end

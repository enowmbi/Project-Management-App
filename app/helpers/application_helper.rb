module ApplicationHelper
  def task_status(task)
     task.complete? ? 'Complete': 'Incomplete'
  end
end

json.extract! project, :id, :name, :description, :duration, :status, :created_at, :updated_at
json.url project_url(project, format: :json)

json.extract! project, :id, :outstanding, :approved, :deleted, :title, :description, :ammount, :days_to_go, :picture, :video, :descriptive_page, :delivery_date, :created_at, :updated_at
json.url project_url(project, format: :json)

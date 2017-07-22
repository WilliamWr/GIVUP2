json.extract! event, :id, :title, :description, :start, :end, :address, :created_at, :updated_at
json.url event_url(event, format: :json)

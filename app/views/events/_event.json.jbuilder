json.extract! event, :id, :title, :description, :event_date, :start_time, :host_id, :created_at, :updated_at
json.url event_url(event, format: :json)

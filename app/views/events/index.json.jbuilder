json.array!(@events) do |event|
  json.extract! event, :id, :title, :body, :link
  json.url event_url(event, format: :json)
end

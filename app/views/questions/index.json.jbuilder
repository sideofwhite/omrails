json.array!(@questions) do |question|
  json.extract! question, :body, :comment_id, :user_id
  json.url question_url(question, format: :json)
end

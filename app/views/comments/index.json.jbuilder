json.array!(@comments) do |comment|
  json.extract! comment, :post_id, :user_id, :title, :subtitle, :body
  json.url comment_url(comment, format: :json)
end

json.array!(@pictures) do |picture|
  json.extract! picture, :image_file_name, :image_content_type, :image_file_size, :post_id, :user_id, :description, :image_remote_url
  json.url picture_url(picture, format: :json)
end

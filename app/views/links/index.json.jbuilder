json.array!(@links) do |link|
  json.extract! link, 
  json.url link_url(link, format: :json)
end

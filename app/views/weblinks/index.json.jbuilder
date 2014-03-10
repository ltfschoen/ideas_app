json.array!(@weblinks) do |weblink|
  json.extract! weblink, :id, :name, :url, :user_id
  json.url weblink_url(weblink, format: :json)
end

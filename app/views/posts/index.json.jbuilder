json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :body, :email
  json.url post_url(post, format: :json)
end

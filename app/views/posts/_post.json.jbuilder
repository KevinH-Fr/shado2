json.extract! post, :id, :athlete_id, :title, :location, :content, :exclusif, :created_at, :updated_at
json.url post_url(post, format: :json)

json.extract! athlete, :id, :user_id, :name, :bio, :created_at, :updated_at
json.url athlete_url(athlete, format: :json)

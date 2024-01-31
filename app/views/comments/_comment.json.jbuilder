json.extract! comment, :id, :body, :user_id, :commentable_id, :commentable_type, :deleted_at, :created_at, :updated_at
json.url comment_url(comment, format: :json)

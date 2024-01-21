json.extract! subscription, :id, :campaign_id, :fan_id, :stripe_product_id, :stripe_price_id, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)

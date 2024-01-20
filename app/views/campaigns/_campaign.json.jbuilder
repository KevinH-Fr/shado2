json.extract! campaign, :id, :athlete_id, :title, :description, :periodicity, :subscription, :target, :start, :end, :thankyounote, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)

class AddStripePriceIdToCampaigns < ActiveRecord::Migration[7.1]
  def change
    add_column :campaigns, :stripe_price_id, :string
  end
end

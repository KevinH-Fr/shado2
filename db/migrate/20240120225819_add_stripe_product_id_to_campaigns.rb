class AddStripeProductIdToCampaigns < ActiveRecord::Migration[7.1]
  def change
    add_column :campaigns, :stripe_product_id, :string
  end
end

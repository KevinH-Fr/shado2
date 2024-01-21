class AddStatsToCampaigns < ActiveRecord::Migration[7.1]
  def change
    add_column :campaigns, :status, :string
  end
end

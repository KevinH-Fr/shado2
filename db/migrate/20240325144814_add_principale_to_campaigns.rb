class AddPrincipaleToCampaigns < ActiveRecord::Migration[7.1]
  def change
    add_column :campaigns, :principale, :boolean
  end
end

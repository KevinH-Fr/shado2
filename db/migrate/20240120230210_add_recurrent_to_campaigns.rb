class AddRecurrentToCampaigns < ActiveRecord::Migration[7.1]
  def change
    add_column :campaigns, :recurrent, :boolean
  end
end

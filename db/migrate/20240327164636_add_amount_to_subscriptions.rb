class AddAmountToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :subscriptions, :amount, :integer
  end
end

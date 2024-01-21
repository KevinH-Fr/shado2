class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :campaign, null: false, foreign_key: true
      t.references :fan, null: false, foreign_key: true
      t.string :stripe_product_id
      t.string :stripe_price_id

      t.timestamps
    end
  end
end

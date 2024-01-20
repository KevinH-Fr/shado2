class CreateCampaigns < ActiveRecord::Migration[7.1]
  def change
    create_table :campaigns do |t|
      t.references :athlete, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :periodicity
      t.decimal :subscription
      t.decimal :target
      t.date :start
      t.date :end
      t.text :thankyounote

      t.timestamps
    end
  end
end

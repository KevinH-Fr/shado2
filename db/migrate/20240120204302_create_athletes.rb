class CreateAthletes < ActiveRecord::Migration[7.1]
  def change
    create_table :athletes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :bio

      t.timestamps
    end
  end
end

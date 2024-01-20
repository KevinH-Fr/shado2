class CreateFans < ActiveRecord::Migration[7.1]
  def change
    create_table :fans do |t|
      t.references :user, null: false, foreign_key: true
      t.string :pseudo
      t.text :bio

      t.timestamps
    end
  end
end

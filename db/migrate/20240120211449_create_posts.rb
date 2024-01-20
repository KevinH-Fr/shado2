class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :athlete, null: false, foreign_key: true
      t.string :title
      t.string :location
      t.text :content
      t.boolean :exclusif

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :user, null: false, foreign_key: true
      t.references :commentable, polymorphic: true, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

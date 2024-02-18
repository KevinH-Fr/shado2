class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversations, index: true
      t.references :users, index: true
      
      t.timestamps
    end
  end
end

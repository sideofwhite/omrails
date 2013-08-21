class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.string :subtitle
      t.string :body
      t.references :post, index: true
      t.integer :user_id

      t.timestamps
    end
    add_index :texts, :user_id
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :title
      t.string :subtitle
      t.string :body

      t.timestamps
    end
    add_index :comments, :post_id
    add_index :comments, :user_id
  end
end

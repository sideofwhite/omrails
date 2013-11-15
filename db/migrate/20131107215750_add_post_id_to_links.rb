class AddPostIdToLinks < ActiveRecord::Migration
  def change
    add_column :links, :post_id, :integer
    add_index :links, :post_id
  end
end

class AddPostIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :post_id, :integer
    add_index :events, :post_id
  end
end

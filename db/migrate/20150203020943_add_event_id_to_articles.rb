class AddEventIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :event_id, :integer
    add_index :articles, :event_id
  end
end

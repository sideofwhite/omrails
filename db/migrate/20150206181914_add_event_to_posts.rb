class AddEventToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :event, :boolean, default: false
  end
end

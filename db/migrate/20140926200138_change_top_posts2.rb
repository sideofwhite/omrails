class ChangeTopPosts2 < ActiveRecord::Migration
  def change
  	change_column :posts, :top, :boolean, default: false
  end
end

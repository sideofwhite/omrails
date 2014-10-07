class ChangeTopPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :top, :boolean
  end
end

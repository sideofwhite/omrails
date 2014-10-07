class ChangeTopForPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :top, :boolean, default: true
  end
end

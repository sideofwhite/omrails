class ChangeHideForPosts2 < ActiveRecord::Migration
  def change
  	change_column :posts, :hide, :boolean, default: false
  end
end

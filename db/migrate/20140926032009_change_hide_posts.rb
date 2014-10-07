class ChangeHidePosts < ActiveRecord::Migration
  def change
  	change_column :posts, :hide, :boolean, default: true
  end
end

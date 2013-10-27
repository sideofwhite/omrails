class ChangeDescriptionForPosts < ActiveRecord::Migration
  def change
  change_column :posts, :description, :text, :limit => nil
  end
end

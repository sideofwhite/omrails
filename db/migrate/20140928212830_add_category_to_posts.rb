class AddCategoryToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :category, :boolean, default: false
  end
end

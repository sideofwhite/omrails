class AddDistanceToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :distance, :integer
  end
end

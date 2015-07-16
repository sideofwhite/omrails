class AddTweetsToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :tweet, :string
  	remove_column :comments, :subtitle, :string
  end
end

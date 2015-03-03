class AddInfoToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :link, :string
  	add_column :comments, :info, :text, :limit => nil
  end
end

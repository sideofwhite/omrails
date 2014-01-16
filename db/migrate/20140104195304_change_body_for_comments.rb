class ChangeBodyForComments < ActiveRecord::Migration
  def change
  change_column :comments, :body, :text, :limit => nil
  end
end

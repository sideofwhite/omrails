class ChangeAboutForComments < ActiveRecord::Migration
  def change
  change_column :comments, :about, :text, :limit => nil
  end
end

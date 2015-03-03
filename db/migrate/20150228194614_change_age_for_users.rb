class ChangeAgeForUsers < ActiveRecord::Migration
  def change
  	change_column :users, :age, :text, :limit => nil
  end
end

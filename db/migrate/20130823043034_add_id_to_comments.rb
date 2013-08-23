class AddIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :id, :integer
  end
end

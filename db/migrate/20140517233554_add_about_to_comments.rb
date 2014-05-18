class AddAboutToComments < ActiveRecord::Migration
  def change
    add_column :comments, :about, :string
  end
end

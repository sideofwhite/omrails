class AddSlugToComments < ActiveRecord::Migration
  def change
    add_column :comments, :slug, :string
    add_index :comments, :slug
  end
end

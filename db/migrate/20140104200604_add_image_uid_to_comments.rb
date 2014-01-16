class AddImageUidToComments < ActiveRecord::Migration
  def change
    add_column :comments, :image_uid, :string
  end
end

class AddPositionToComments < ActiveRecord::Migration
   def change
    add_column :comments, :position, :integer
    add_column :comments, :video_url, :string
  end
end

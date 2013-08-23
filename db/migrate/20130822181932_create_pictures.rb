class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.integer :post_id
      t.integer :user_id
      t.string :description
      t.string :image_remote_url

      t.timestamps
    end
  end
end

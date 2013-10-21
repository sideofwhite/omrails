class AddImageRemoteUrlToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :image_remote_url, :string
  end
end

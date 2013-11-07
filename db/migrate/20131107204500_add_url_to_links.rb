class AddUrlToLinks < ActiveRecord::Migration
  def change
    add_column :links, :URL, :string
  end
end

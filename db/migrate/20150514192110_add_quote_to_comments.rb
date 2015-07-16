class AddQuoteToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :quote_author, :string
  end
end

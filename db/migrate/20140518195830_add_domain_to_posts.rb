class AddDomainToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :domain, :string
  end
end

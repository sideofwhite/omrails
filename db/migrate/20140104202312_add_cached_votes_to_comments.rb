class AddCachedVotesToComments < ActiveRecord::Migration
  def change
    add_column :comments, :cached_votes_total, :integer, :default => 0
  end
end

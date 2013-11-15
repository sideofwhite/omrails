class AddCachedVotesToLinks < ActiveRecord::Migration
  def change
    add_column :links, :cached_votes_total, :integer, :default => 0
  end
end

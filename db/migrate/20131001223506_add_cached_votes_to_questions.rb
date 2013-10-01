class AddCachedVotesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :cached_votes_total, :integer, :default => 0
  end
end

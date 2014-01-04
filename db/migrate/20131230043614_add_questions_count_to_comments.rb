class AddQuestionsCountToComments < ActiveRecord::Migration
  def change
  add_column :comments, :questions_count, :integer, :default => 0
  end
end

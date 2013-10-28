class ChangeBodyForQuestions < ActiveRecord::Migration
  def change
  change_column :questions, :body, :text, :limit => nil
  end
end

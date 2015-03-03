class AddHintToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :alt, :string, default: ""
  	add_column :questions, :hint, :string, default: ""
  end
end

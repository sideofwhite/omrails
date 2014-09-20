class AddAnonToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :anon, :boolean
  end
end

class AddHideToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :hide, :boolean, default: false
  end
end

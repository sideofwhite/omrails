class AddRecommendToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :recommend, :boolean, default: false
  end
end

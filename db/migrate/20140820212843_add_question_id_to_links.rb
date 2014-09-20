class AddQuestionIdToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :question_id, :integer
    add_index :links, :question_id
  end
end

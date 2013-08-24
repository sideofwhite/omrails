class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body
      t.integer :comment_id
      t.integer :user_id

      t.timestamps
    end
    add_index :questions, :comment_id
    add_index :questions, :user_id
  end
end

class AddCaptionToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :caption, :string
  end
end

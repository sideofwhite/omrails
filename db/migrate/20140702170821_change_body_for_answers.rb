class ChangeBodyForAnswers < ActiveRecord::Migration
  def change
  	change_column :answers, :body, :string
  end
end

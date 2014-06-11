class ChangeBodyForAnswers < ActiveRecord::Migration
  def change
  	change_column :answers, :body, :text, :limit => nil
  end
end




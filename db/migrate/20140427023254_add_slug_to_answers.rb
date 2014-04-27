class AddSlugToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :slug, :string
    add_index :answers, :slug
  end
end

class ChangeReadForActivities < ActiveRecord::Migration
  def change
  	change_column :activities , :read , :boolean , default: false
  end
end

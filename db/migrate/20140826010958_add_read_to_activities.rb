class AddReadToActivities < ActiveRecord::Migration
  def change
  	add_column :activities, :read, :boolean
  end
end

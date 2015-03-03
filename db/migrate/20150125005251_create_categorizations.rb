class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :comment_id
      t.integer :event_id

      t.timestamps
    end
    add_index :categorizations, :comment_id
    add_index :categorizations, :event_id
  end
end

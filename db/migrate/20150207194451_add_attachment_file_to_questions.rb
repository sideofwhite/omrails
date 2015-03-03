class AddAttachmentFileToQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :questions, :file
  end
end

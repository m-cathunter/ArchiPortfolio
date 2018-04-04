class AddAttachmentProjectImgToProjects < ActiveRecord::Migration[5.1]
  def self.up
    change_table :projects do |t|
      t.attachment :project_img
    end
  end

  def self.down
    remove_attachment :projects, :project_img
  end
end

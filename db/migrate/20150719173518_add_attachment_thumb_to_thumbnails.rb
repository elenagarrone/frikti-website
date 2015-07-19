class AddAttachmentThumbToThumbnails < ActiveRecord::Migration
  def self.up
    change_table :thumbnails do |t|
      t.attachment :thumb
    end
  end

  def self.down
    remove_attachment :thumbnails, :thumb
  end
end

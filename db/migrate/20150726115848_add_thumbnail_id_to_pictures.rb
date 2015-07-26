class AddThumbnailIdToPictures < ActiveRecord::Migration
  def change
    add_reference :pictures, :thumbnail, index: true
    add_foreign_key :pictures, :thumbnails
  end
end

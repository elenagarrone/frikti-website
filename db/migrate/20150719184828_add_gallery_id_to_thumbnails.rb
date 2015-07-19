class AddGalleryIdToThumbnails < ActiveRecord::Migration
  def change
    add_reference :thumbnails, :gallery, index: true
    add_foreign_key :thumbnails, :galleries
  end
end

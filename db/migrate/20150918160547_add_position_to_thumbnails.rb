class AddPositionToThumbnails < ActiveRecord::Migration
  def change
    add_column :thumbnails, :position, :integer
  end
end

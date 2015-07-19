class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|

      t.timestamps null: false
    end
  end
end

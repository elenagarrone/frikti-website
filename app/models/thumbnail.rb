class Thumbnail < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :thumb
end

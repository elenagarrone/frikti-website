class Thumbnail < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :thumb
  validates_attachment_content_type :thumb, :content_type => /\Aimage\/.*\Z/
end

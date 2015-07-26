class Picture < ActiveRecord::Base
  belongs_to :thumbnail
  has_attached_file :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end

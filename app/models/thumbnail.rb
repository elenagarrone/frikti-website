class Thumbnail < ActiveRecord::Base
  belongs_to :gallery
  has_one :picture, dependent: :destroy
  has_attached_file :thumb
  validates_attachment_content_type :thumb, :content_type => /\Aimage\/.*\Z/
end

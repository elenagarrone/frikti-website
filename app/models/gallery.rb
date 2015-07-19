class Gallery < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :thumbnails, dependent: :destroy
  validates_presence_of :name
end

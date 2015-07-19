class Gallery < ActiveRecord::Base
  has_many :thumbnails, dependent: :destroy
  validates_presence_of :name
end

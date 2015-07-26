class Gallery < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :thumbnails, dependent: :destroy
  validates_presence_of :name

  def should_generate_new_friendly_id?
    name_changed?
  end
end

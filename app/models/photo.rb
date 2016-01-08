class Photo < ActiveRecord::Base
  mount_uploader :art_photo, ArtPhotoUploader
  belongs_to :art

  validates :name, presence: true
end

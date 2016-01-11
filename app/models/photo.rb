class Photo < ActiveRecord::Base
  mount_uploader :art_photo, ArtPhotoUploader
  belongs_to :art

  validates :art_photo, presence: true
  validates :art, presence: true
end

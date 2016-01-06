class Photo < ActiveRecord::Base
  belongs_to :art

  validates :url, presence: true
end

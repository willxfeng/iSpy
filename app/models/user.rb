class User < ActiveRecord::Base
  has_many :arts
  has_many :reviews

  mount_uploader :profile_photo, ProfilePhotoUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == 'admin'
  end
end

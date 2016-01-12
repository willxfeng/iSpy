class Art < ActiveRecord::Base
  has_many :reviews
  has_many :photos

  belongs_to :user

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :category, presence: true

  accepts_nested_attributes_for :photos, allow_destroy: true
end

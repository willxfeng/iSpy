class Art < ActiveRecord::Base

  has_many :reviews
  has_many :photos

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :category, presence: true
end

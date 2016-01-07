class Art < ActiveRecord::Base
  has_many :reviews
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :category, presence: true
end

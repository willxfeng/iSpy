class Art < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_name, against: :name, using: {
    tsearch: {
      prefix: true
    }
  }

  belongs_to :user
  has_many :reviews
  has_many :photos

  belongs_to :user

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :user, presence: true

  accepts_nested_attributes_for :photos, allow_destroy: true
end

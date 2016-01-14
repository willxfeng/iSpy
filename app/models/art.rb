class Art < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_name, against: :name, using: {
    tsearch: {
      prefix: true
    }
  }

  # max_paginates_per 1

  belongs_to :user
  has_many :reviews
  has_many :photos

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :user, presence: true

  accepts_nested_attributes_for :photos, allow_destroy: true
end

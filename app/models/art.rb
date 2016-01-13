class Art < ActiveRecord::Base
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

  def self.search(search)
    if search
      find(:id, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:id)
    end
  end
end

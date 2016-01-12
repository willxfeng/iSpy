class Review < ActiveRecord::Base
  belongs_to :art
  belongs_to :user
  
  validates :body, presence: true
  validates :rating, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
  }
  validates :user_id, presence: true
  validates :art_id, presence: true
end

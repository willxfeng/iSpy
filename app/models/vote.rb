class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :upvote, inclusion: { in: [true, false, 1, 0] }
end

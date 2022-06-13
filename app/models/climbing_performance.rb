class ClimbingPerformance < ApplicationRecord
  belongs_to :user

  validates :climbing_frequency, :climbing_experience, :climbing_level, numericality: { only_integer: true , :greater_than_or_equal_to => 0}

end

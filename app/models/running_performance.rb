class RunningPerformance < ApplicationRecord
  belongs_to :user

  validates :running_frequency, :running_experience, :running_distance, :running_speed, numericality: { only_integer: true , :greater_than_or_equal_to => 0}
end

class WorkoutPerformance < ApplicationRecord
  belongs_to :user

  validates :workout_frequency, :workout_experience,:workout_benchpress_weight, :workout_squat_weight, numericality: { only_integer: true , :greater_than_or_equal_to => 0}

end

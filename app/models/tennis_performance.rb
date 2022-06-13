class TennisPerformance < ApplicationRecord
  belongs_to :user

  validates :tennis_frequency, :tennis_experience, numericality: { only_integer: true , :greater_than_or_equal_to => 0}
end

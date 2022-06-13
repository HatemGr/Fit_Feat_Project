class FutsalPerformance < ApplicationRecord
  belongs_to :user

  validates :futsal_frequency, :futsal_experience, numericality: { only_integer: true , :greater_than_or_equal_to => 0}
end

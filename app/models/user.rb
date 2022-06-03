class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :tennis_frequency, :workout_frequency, :climbing_frequency, :futsal_frequency, :running_frequency, numericality: { only_integer: true , :greater_than_or_equal_to => 0}
  validates :tennis_experience, :workout_experience, :climbing_experience, :futsal_experience, :running_experience, numericality: { only_integer: true , :greater_than_or_equal_to => 0}
  validates :climbing_level, :workout_benchpress_weight, :workout_squat_weight, :running_distance, :running_speed, numericality: { only_integer: true , :greater_than_or_equal_to => 0}

  has_many :events, foreign_key: 'admin_id', class_name: "Event"
  belongs_to :city
  has_many :sport_users
  has_many :sports, through: :sport_users
  has_many :suggestions, foreign_key: 'partnera_id', class_name: "Suggestion"
  has_many :suggestions, foreign_key: 'partnerb_id', class_name: "Suggestion"

end

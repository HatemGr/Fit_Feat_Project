class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participants, dependent: :delete_all
  has_many :events, through: :participants
  has_many :admin_events, foreign_key: 'admin_id', class_name: "Event", dependent: :delete_all
  belongs_to :city
  has_many :sport_users, dependent: :delete_all
  has_many :sports, through: :sport_users
  has_many :suggestions, foreign_key: 'partnera_id', class_name: "Suggestion", dependent: :delete_all
  has_many :suggestions, foreign_key: 'partnerb_id', class_name: "Suggestion", dependent: :delete_all
  
  has_one :tennis_performance, dependent: :destroy
  has_one :workout_performance, dependent: :destroy
  has_one :running_performance, dependent: :destroy
  has_one :climbing_performance, dependent: :destroy
  has_one :futsal_performance, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  validates :first_name, :last_name, length: { maximum: 15 }

  def full_name 
    "#{first_name} #{last_name}"
  end

  def markers
    User.all.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        city: user.city.name,
        name: user.full_name
      }
    end
  end
  
  def suggestion_list
    suggestion_list = Array.new
    if self.suggestions 
      self.suggestions.each {|suggestion| suggestion.partnera == self ? suggestion_list << suggestion.partnerb : suggestion_list << suggestion.partnera }
    end
    return suggestion_list
  end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :city
  has_many :sport_users
  has_many :sports, through: :sport_users
  has_many :suggestions, foreign_key: 'partnera_id', class_name: "Suggestion"
  has_many :suggestions, foreign_key: 'partnerb_id', class_name: "Suggestion"

end

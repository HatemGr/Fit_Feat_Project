class Event < ApplicationRecord
  belongs_to :city
  belongs_to :admin, class_name: "User"
  belongs_to :sport
  has_many :participants, dependent: :delete_all
  has_many :users, through: :participants

  validate :start_after_now, on: :create

  def start_after_now
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

end

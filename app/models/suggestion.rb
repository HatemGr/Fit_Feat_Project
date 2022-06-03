class Suggestion < ApplicationRecord

  validates_uniqueness_of :partnera, :scope => [:partnerb]
  validates_uniqueness_of :partnerb, :scope => [:partnera]
  validate :check_different_partners

  belongs_to :partnera, class_name: "User"
  belongs_to :partnerb, class_name: "User"

  def check_different_partners
    errors.add(:partnerb, "can't be same users for suggestion") if partnera == partnerb
    errors.add(:partnera, "suggestion already exist") if Suggestion.find_by(partnera:partnerb, partnerb:partnera)
  end
end

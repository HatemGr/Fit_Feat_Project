class Suggestion < ApplicationRecord
  belongs_to :partnera, class_name: "User"
  belongs_to :partnerb, class_name: "User"
end

class Event < ApplicationRecord
  belongs_to :city
  belongs_to :admin, class_name: "User"
  belongs_to :sport

end

class SportUser < ApplicationRecord
  belongs_to :user
  belongs_to :sport

  validates_uniqueness_of :user, :scope => [:sport]

end

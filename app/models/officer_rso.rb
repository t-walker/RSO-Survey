class OfficerRso < ApplicationRecord
  belongs_to :officer
  belongs_to :rso
  validates_uniqueness_of :officer_id, :scope => :rso_id, :message => " has already been added to this RSO"

end

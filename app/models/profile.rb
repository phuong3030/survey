class Profile < ApplicationRecord
  GENDERS = ["Male", "Female"]
  belongs_to :respondent

  validates :gender, inclusion: { in: GENDERS }
end

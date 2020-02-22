class Respondent < ApplicationRecord
  has_many :surveys
  has_one :profile
  validates :first_name, :last_name, presence: true
end

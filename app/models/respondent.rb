class Respondent < ApplicationRecord
  has_many :surveys
  has_one :profile, dependent: :destroy
  validates :first_name, :last_name, presence: true

  accepts_nested_attributes_for :profile
end

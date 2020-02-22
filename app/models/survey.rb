class Survey < ApplicationRecord
  belongs_to :respondent
  has_many :answers, class_name: "Answer::Base"
  has_many :questions, through: :answers, class_name: "Question::Base"
end

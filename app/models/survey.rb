class Survey < ApplicationRecord
  belongs_to :respondent
  has_many :answers, class_name: "Answer::Base"
  has_many :questions, through: :answers, class_name: "Question::Base"

  def all_uniq_answer_question_ids
    answers.where.not(body: nil).pluck(:question_id)
  end

  def question_ids
    questions.pluck(:id)
  end

  def finished?
    answers_question_ids = all_uniq_answer_question_ids
    answers_question_ids.length > 0 && ((answers_question_ids & question_ids) == answers_question_ids)
  end
end

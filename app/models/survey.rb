class Survey < ApplicationRecord
  belongs_to :respondent
  has_many :answers, class_name: "Answer::Base"
  has_many :questions, class_name: "Question::Base", through: :answers

  accepts_nested_attributes_for :questions, :answers, :respondent
  validate :valid_answer_all_required_questions, on: :answer_questions

  def all_uniq_answer_question_ids
    answers.select { |a| a.body }.pluck(:question_id)
  end

  def required_question_ids
    questions.where(optional: false).pluck(:id)
  end

  def valid_answer_all_required_questions
    answers_question_ids = all_uniq_answer_question_ids
    required_questions = required_question_ids
    is_missed_required_questions = answers_question_ids.length > 0 && !((answers_question_ids & required_questions) == required_questions)

    errors.add :answers, "must answer all required questions" if is_missed_required_questions
  end
end

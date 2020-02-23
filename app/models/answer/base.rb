module Answer
  class Base < ApplicationRecord
    self.inheritance_column = :type
    self.table_name = "questions_surveys"

    belongs_to :question, class_name: "Question::Base"
    belongs_to :survey

    validate :correct_question_type

    def is_optional
      question.optional?
    end
  end
end

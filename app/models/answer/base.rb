module Answer
  class Base < ApplicationRecord
    self.inheritance_column = :type
    self.table_name = "questions_surveys"

    belongs_to :question, class_name: "Question::Base"
    belongs_to :survey

    validate :correct_question_type
    before_save { |answer|
      answer.type = "Answer::#{self.question.class.name.demodulize}"
    }

    def is_optional
      question.optional?
    end

    private
      def correct_question_type
        true
      end
  end
end

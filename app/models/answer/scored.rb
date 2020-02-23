module Answer
  class Scored < Base
    attr_accessor :numeric_body
    VALID_ANSWER = [1, 2, 3, 4, 5].freeze

    validates :numeric_body, inclusion: { in: VALID_ANSWER }, unless: :is_optional

    before_save { |answer| answer.body = answer.numeric_body.to_s }

    private
      def correct_question_type
        errors.add :question, "must be scored question" unless question.instance_of? Question::Scored
      end
  end
end

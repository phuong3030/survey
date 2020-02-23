module Answer
  class Scored < Base
    attr_accessor :numeric_body
    VALID_ANSWER = ['1', '2', '3', '4', '5'].freeze

    validates :body, inclusion: { in: VALID_ANSWER }, unless: :is_optional

    scope :calculate_body_average, -> {
      where.not(body: nil)
        .group(:question_id)
        .average('CAST(body as integer)')
        .map { |k, v| { question_id: k, average_score: v } }
    }

    private
      def correct_question_type
        errors.add :question, "must be scored question" unless question.instance_of? Question::Scored
      end
  end
end

module Answer
  class OpenEnded < Base
    validates :body, length: { minimum: 1, maximum: 256 }, unless: :is_optional

    private
      def correct_question_type
        errors.add :question, "must be open ended question" unless question.instance_of? Question::OpenEnded
      end
  end
end

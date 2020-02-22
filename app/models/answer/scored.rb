module Answer
  class Scored < Base
    attr_accessor :numeric_body
    VALID_ANSWER = [1, 2, 3, 4, 5].freeze

    validates :numeric_body, inclusion: { in: VALID_ANSWER }

    before_save { |answer| answer.body = answer.numeric_body.to_s }
  end
end

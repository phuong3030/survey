module Question
  class Base < ApplicationRecord
    self.inheritance_column = :type
    self.table_name = "questions"

    validates :prompt, presence: true

    def self.generate(params)
      if params["type"]
        Scored.new params.except("type")
      else
        OpenEnded.new params.except("type")
      end
    end

    # TODO: Object skin should be in presenter layer
    def type_represent
      type == 'Question::Scored' ? 'scored' : 'open_ended'
    end
  end
end

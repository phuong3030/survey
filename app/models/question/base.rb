module Question
  class Base < ApplicationRecord
    self.inheritance_column = :type
    self.table_name = "questions"

    validates :prompt, presence: true
  end
end

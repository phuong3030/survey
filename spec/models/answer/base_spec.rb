require 'rails_helper'

RSpec.describe Answer::Base, type: :model do
  describe 'Callbacks' do
    [
      [ :scored_question, Answer::Scored.name ],
      [ :open_ended_question, Answer::OpenEnded.name ]
    ].each do |type, expected_type|
      it "create #{expected_type} by #{type}" do
        answer = create(:answer, question: build(type))
        expect(answer.type).to eq(expected_type)
      end
    end
  end
end

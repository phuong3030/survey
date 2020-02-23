require 'rails_helper'

RSpec.describe Answer::OpenEnded, type: :model do
  subject { create(:open_ended_answer) }

  it_behaves_like "Answer class"

  describe 'validations' do
    context 'must answer question' do
      subject { build(:open_ended_answer, question: create(:open_ended_question, optional: false)) }
      it { should validate_length_of(:body).is_at_most(256) }
      it { should validate_length_of(:body).is_at_least(1) }
    end

    context 'optional question' do
      it { is_expected.not_to validate_length_of(:body).is_at_most(256) }
      it { is_expected.not_to validate_length_of(:body).is_at_least(1) }
    end

    it 'must correct question type' do
      answer = build(:open_ended_answer, question: create(:scored_question, optional: false))
      answer.valid?
      expect(answer.errors[:question]).to include("must be open ended question")
    end
  end
end

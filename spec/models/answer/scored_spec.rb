require 'rails_helper'

RSpec.describe Answer::Scored, type: :model do
  subject { create(:scored_answer) }

  it_behaves_like "Answer class"

  describe 'validations' do
    context 'must answer question' do
      subject { build(:scored_answer, question: create(:scored_question, optional: false)) }
      it { should validate_inclusion_of(:numeric_body).in_array(Answer::Scored::VALID_ANSWER) }
    end

    context 'optional question' do
      it { is_expected.not_to validate_inclusion_of(:body).in_array(Answer::Scored::VALID_ANSWER) }
    end

    it 'must correct question type' do
      answer = build(:scored_answer, question: create(:open_ended_question, optional: false))
      answer.valid?
      expect(answer.errors[:question]).to include("must be scored question")
    end
  end

  describe 'Associations' do
  end

  it 'should update body before save' do
    expect(subject.body).to eq(subject.numeric_body.to_s)
  end

end

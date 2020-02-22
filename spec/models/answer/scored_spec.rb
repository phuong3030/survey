require 'rails_helper'

RSpec.describe Answer::Scored, type: :model do
  it_behaves_like "Answer class"
  it { should validate_inclusion_of(:numeric_body).in_array(Answer::Scored::VALID_ANSWER) }

  it 'should update body before save' do
    scored_answer = create(:scored_answer)
    expect(scored_answer.body).to eq(scored_answer.numeric_body.to_s)
  end
end

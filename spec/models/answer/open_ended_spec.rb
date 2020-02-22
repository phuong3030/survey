require 'rails_helper'

RSpec.describe Answer::OpenEnded, type: :model do
  it_behaves_like "Answer class"
  it { should validate_length_of(:body).is_at_most(256) }
end

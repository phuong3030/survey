require 'rails_helper'

RSpec.describe Survey, type: :model do
  it { should belong_to(:respondent) }
  it { should have_many(:questions) }
  it { should have_many(:answers) }
end

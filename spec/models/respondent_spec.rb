require 'rails_helper'

RSpec.describe Respondent, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should have_many(:surveys) }
  it { should have_one(:profile) }
end

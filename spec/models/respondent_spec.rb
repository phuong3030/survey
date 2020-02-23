require 'rails_helper'

RSpec.describe Respondent, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should have_many(:surveys) }
  it { should have_one(:profile) }
  it { should accept_nested_attributes_for(:profile) }
end

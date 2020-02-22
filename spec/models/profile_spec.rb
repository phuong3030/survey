require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to(:respondent) }
  it { should validate_inclusion_of(:gender).in_array(Profile::GENDERS) }
end

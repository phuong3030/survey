require 'rails_helper'

shared_examples "Answer class" do
  it "should have attribute type" do
    expect(subject).to have_attribute :type
  end

  describe 'Associations' do
    it { should belong_to(:question).without_validating_presence  }
    it { should belong_to(:survey) }
  end
end

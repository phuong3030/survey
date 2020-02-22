require 'rails_helper'

shared_examples "Answer class" do
  it "should have attribute type" do
    expect(subject).to have_attribute :type
  end

  it { should belong_to(:question) }
  it { should belong_to(:survey) }
end

require 'rails_helper'

shared_examples "Question class" do
  it "should have attribute type" do
    expect(subject).to have_attribute :type
  end

  it { should validate_presence_of(:prompt) }
end

require 'rails_helper'

RSpec.describe Interval, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:interval)).to be_valid
  end
  let(:interval) {FactoryGirl.build(:interval)}
  describe "Associations" do
    it {should belong_to(:task)}
  end
  describe "Validation" do
    it {should validate_presence_of(:intrvlbegin)}
    it {should validate_presence_of(:intrvlend)}
  end
end

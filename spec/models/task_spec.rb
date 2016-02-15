require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:task)).to be_valid
  end
  let(:task) {FactoryGirl.build(:task)}
  describe "Associations" do
    it {should have_many(:intervals)}
    it {should belong_to(:project)}
  end
  describe "Validation" do
    it {should validate_presence_of(:name)}
  end
end

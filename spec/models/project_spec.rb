require 'rails_helper'

RSpec.describe Project, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:project)).to be_valid
  end
  let(:project) {FactoryGirl.build(:project)}
  describe "Associations" do
    it {should have_many(:tasks)}
    it {should have_many(:intervals)}
    it {should belong_to(:user)}
  end
  describe "Validation" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:user_id)}
  end
end

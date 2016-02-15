require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:first_user)).to be_valid
  end
  let(:user) {FactoryGirl.build(:first_user)}
  describe "Associations" do
    it {should have_many(:projects)}
    it {should have_many(:tasks)}
  end
end

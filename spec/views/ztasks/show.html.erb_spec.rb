require 'rails_helper'

RSpec.describe "ztasks/show", type: :view do
  before(:each) do
    @ztask = FactoryGirl.create(:ztask)
    @zproject = FactoryGirl.create(:zproject)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end

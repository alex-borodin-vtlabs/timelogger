require 'rails_helper'

RSpec.describe "zprojects/show", type: :view do
  before(:each) do
    @zproject = FactoryGirl.create(:zproject)
    @ztasks = @zproject.ztask
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end

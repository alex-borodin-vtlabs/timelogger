require 'rails_helper'

RSpec.describe "ztasks/edit", type: :view do
  before(:each) do
    @ztask = FactoryGirl.create(:ztask)
    @zproject = FactoryGirl.create(:zproject)
  end

  it "renders the edit ztask form" do
    render

    assert_select "form[action=?][method=?]", zproject_ztask_path(@zproject, @ztask), "post" do

      assert_select "input#ztask_name[name=?]", "ztask[name]"

    end
  end
end

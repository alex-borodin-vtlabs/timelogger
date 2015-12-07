require 'rails_helper'

RSpec.describe "ztasks/new", type: :view do
  before(:each) do
    @ztask = FactoryGirl.create(:ztask)
    @zproject = FactoryGirl.create(:zproject)
  end

  it "renders new ztask form" do
    render

    assert_select "form[action=?][method=?]", zproject_ztask_path(@zproject, @ztask), "post" do

      assert_select "input#ztask_name[name=?]", "ztask[name]"


    end
  end
end

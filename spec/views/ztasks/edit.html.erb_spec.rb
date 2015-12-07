require 'rails_helper'

RSpec.describe "ztasks/edit", type: :view do
  before(:each) do
    @ztask = assign(:ztask, Ztask.create!(
      :name => "MyString",
      :zproject_id => 1
    ))
  end

  it "renders the edit ztask form" do
    render

    assert_select "form[action=?][method=?]", ztask_path(@ztask), "post" do

      assert_select "input#ztask_name[name=?]", "ztask[name]"

      assert_select "input#ztask_zproject_id[name=?]", "ztask[zproject_id]"
    end
  end
end

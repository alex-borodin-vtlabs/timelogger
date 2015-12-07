require 'rails_helper'

RSpec.describe "ztasks/new", type: :view do
  before(:each) do
    assign(:ztask, Ztask.new(
      :name => "MyString",
      :zproject_id => 1
    ))
  end

  it "renders new ztask form" do
    render

    assert_select "form[action=?][method=?]", ztasks_path, "post" do

      assert_select "input#ztask_name[name=?]", "ztask[name]"

      assert_select "input#ztask_zproject_id[name=?]", "ztask[zproject_id]"
    end
  end
end

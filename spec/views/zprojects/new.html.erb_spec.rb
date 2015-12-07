require 'rails_helper'

RSpec.describe "zprojects/new", type: :view do
  before(:each) do
    assign(:zproject, Zproject.new(
      :name => "MyString"
    ))
  end

  it "renders new zproject form" do
    render

    assert_select "form[action=?][method=?]", zprojects_path, "post" do

      assert_select "input#zproject_name[name=?]", "zproject[name]"
    end
  end
end

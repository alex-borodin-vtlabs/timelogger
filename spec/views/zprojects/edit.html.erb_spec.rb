require 'rails_helper'

RSpec.describe "zprojects/edit", type: :view do
  before(:each) do
    @zproject = assign(:zproject, Zproject.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit zproject form" do
    render

    assert_select "form[action=?][method=?]", zproject_path(@zproject), "post" do

      assert_select "input#zproject_name[name=?]", "zproject[name]"
    end
  end
end

require 'rails_helper'

RSpec.describe "zprojects/index", type: :view do
  before(:each) do
    assign(:zprojects, [
      Zproject.create!(
        :name => "Name"
      ),
      Zproject.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of zprojects" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

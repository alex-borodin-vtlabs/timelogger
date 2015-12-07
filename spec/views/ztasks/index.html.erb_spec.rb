require 'rails_helper'

RSpec.describe "ztasks/index", type: :view do
  before(:each) do
    assign(:ztasks, [
      Ztask.create!(
        :name => "Name",
        :zproject_id => 1
      ),
      Ztask.create!(
        :name => "Name",
        :zproject_id => 1
      )
    ])
  end

  it "renders a list of ztasks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

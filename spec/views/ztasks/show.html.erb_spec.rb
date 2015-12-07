require 'rails_helper'

RSpec.describe "ztasks/show", type: :view do
  before(:each) do
    @ztask = assign(:ztask, Ztask.create!(
      :name => "Name",
      :zproject_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end

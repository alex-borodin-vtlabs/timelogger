require 'rails_helper'

RSpec.describe Ztask, type: :model do
  it { should belong_to(:zproject) }
  it { should have_many(:zinterval) }
end

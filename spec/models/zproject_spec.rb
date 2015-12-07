require 'rails_helper'

RSpec.describe Zproject, type: :model do
  it { should have_many(:ztask) }
end

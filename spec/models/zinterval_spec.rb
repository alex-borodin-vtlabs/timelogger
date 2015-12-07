require 'rails_helper'

RSpec.describe Zinterval, type: :model do
  it { should belong_to(:ztask) }
end

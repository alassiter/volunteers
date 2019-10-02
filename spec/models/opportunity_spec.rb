require 'rails_helper'

RSpec.describe Opportunity, type: :model do
  it { expect(build(:opportunity)).to be_valid }
end

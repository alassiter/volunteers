require 'rails_helper'

RSpec.describe Volunteer, type: :model do
  let(:volunteer) { build(:volunteer) }
  
  it { expect(volunteer.first_name).to be_present }
  it { expect(volunteer.last_name).to be_present }

  describe '#name' do
    it 'creates name correctly' do
      first_name = volunteer.first_name
      last_name = volunteer.last_name
      whole_name = [first_name, last_name].join(' ')

      expect(volunteer.name).to eql(whole_name)
    end
  end
end

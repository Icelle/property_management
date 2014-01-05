require 'spec_helper'

describe Building do
  describe "validations" do
    let(:building) {FactoryGirl.build(:building)}

    it 'is valid when it has all required and valid attributes' do
      expect(building).to be_valid
    end

    it {should have_valid(:street).when('1160 Hanover Street')}
    it {should_not have_valid(:street).when('', nil)}
    it {should have_valid(:city).when('Hanover')}
    it {should_not have_valid(:city).when('', nil)}
    it {should have_valid(:state).when("Massachusetts")}
    it {should_not have_valid(:state).when('', nil)}
    it {should_not have_valid(:state).when('Manila', 'Random State Elsewhere')}
    it {should have_valid(:postal_code).when('02339', "12345")}
    it {should_not have_valid(:postal_code).when('', nil, 'a', '123456', '123')}
    end

    it {should belong_to :user}
    it {should have_many :ownerships}
    it {should have_many(:owners).through(:ownerships)}
end

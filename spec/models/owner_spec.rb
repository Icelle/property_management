require 'spec_helper'

describe Owner do
  describe "validations" do
    let(:owner) {FactoryGirl.build(:owner)}

    it 'is valid when it has all required and valid attributes' do
      expect(owner).to be_valid
    end

    it {should have_valid(:first_name).when('Icelle')}
    it {should_not have_valid(:first_name).when('', nil)}
    it {should have_valid(:last_name).when('Ku')}
    it {should_not have_valid(:last_name).when('', nil)}
    it {should have_valid(:email).when('icelleku@gmail.com')}
    it {should_not have_valid(:email).when('', nil, 'a@q')}
    it {should_not have_valid(:email).when('icelleku', 1223, '1234')}
    it {should have_valid(:company_name).when('Launch Academy', '', nil)}
  end

    it {should have_many :buildings}
    it {should have_many(:ownerships).dependent(:destroy)}
    it {should have_many(:buildings).through(:ownerships)}

    describe 'owners' do
      let(:owner) {FactoryGirl.create(:owner)}
      it 'prints owners' do
        owner
        expect(Owner.print_owners.first).to eq(owner.first_name + " " + owner.last_name)
      end
    end

    it 'should not allow two owners with same info' do
      FactoryGirl.create(:owner)
      o = FactoryGirl.build(:owner)
      expect(o.save).to eq false
      expect(Owner.all.size).to eq 1
    end
end

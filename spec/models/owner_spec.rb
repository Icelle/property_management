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
    it {should_not have_valid(:email).when('', nil)}
    it {should_not have_valid(:email).when('icelleku', 1223, '1234')}
    it {should have_valid(:company_name).when('Launch Academy', '', nil)}
  end
end

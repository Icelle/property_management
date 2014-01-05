require 'spec_helper'

feature 'user records owners', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

  let(:owner) { FactoryGirl.build(:owner) }
  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  scenario 'create a valid owner and redirect so user can create another owner' do
    visit new_owner_path

    fill_in 'First name', with: owner.first_name
    fill_in 'Last name', with: owner.last_name
    fill_in 'Email', with: owner.email
    fill_in 'Company name', with: owner.company_name
    click_button 'Create Owner'

    expect(page).to have_content('Owner was successfully recorded.')
    # redirect back to new so user can enter another owner
    expect(current_path).to eq new_owner_path
  end

  scenario 'create an invalid owner' do
      visit new_owner_path
      click_button 'Create Owner'
      expect(page).to have_content("can't be blank")
  end
end

require 'spec_helper'

feature 'user creates a record of building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

  let(:building) { FactoryGirl.build(:building) }

  # If I enter all of the required information in the required format, the building is recorded.
  # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors.
  # Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'create a valid building and redirect so user can create another building' do
    visit new_building_path
    fill_in 'Street', with: building.street
    fill_in 'City', with: building.city
    select building.state, from: 'State'
    fill_in 'Postal code', with: building.postal_code
    click_button 'Create Building'
    expect(page).to have_content('Building was successfully recorded.')
    # redirect back to new so user can enter another building
    expect(current_path).to eq new_building_path
  end

  scenario 'create an invalid building' do
      visit new_building_path
      click_button 'Create Building'
      expect(page).to have_content("can't be blank")
  end
end

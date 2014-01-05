require 'spec_helper'

feature 'user correlates owner with buildings', %Q{
 As a real estate associate
 I want to correlate an owner with buildings
 So that I can refer back to pertinent information
} do
  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.
  let(:owner) { FactoryGirl.create(:owner) }
  let(:building) { FactoryGirl.build(:building) }

  scenario 'when user records building, user can associate building with owner' do
    owner
    visit new_building_path
    fill_in 'Street', with: building.street
    fill_in 'City', with: building.city
    select building.state, from: 'State'
    fill_in 'Postal code', with: building.postal_code
    select owner.first_name + " " + owner.last_name, from: 'Owners'
    click_button 'Create Building'
    expect(page).to have_content('Building was successfully recorded.')
  end

  scenario 'when user deletes an owner, owner and primary key is no longer associated with any building' do
    b = FactoryGirl.create(:building_with_owners)
    visit owners_path

    click_link 'Delete'
    expect(page).to have_content("Owner was successfully deleted.")
    expect(current_path).to eq owners_path
    expect(Owner.all.size).to eq 0
    expect(Ownership.all.size).to eq 0
  end

end

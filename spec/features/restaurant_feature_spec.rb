require 'spec_helper'

describe 'restaurants index page' do
  context 'no restaurants should have been added' do
    it 'should display a message' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
    end
  end
end

describe 'creating a restaurant' do
  it 'adds it to the restaurants index' do
    visit '/restaurants/new'
    fill_in 'Name', with:'Mcdonalds'
    fill_in 'Address', with: 'somewhere'
    click_button 'Create Restaurant'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'Mcdonalds'
  end
end

describe 'editing a restaurant' do
  before  { Restaurant.create(name: 'KFC', address: 'an address')}

  it 'saves the chnage to the restaurant' do
    visit '/restaurants'
    click_link 'Edit KFC'

    fill_in 'Name', with: 'Kentucky Fried Chicken'
    click_button 'Update Restaurant'


    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'Kentucky Fried Chicken'
  end
end
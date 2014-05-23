require 'spec_helper'

describe 'restaurants index page' do
  context 'no restaurants should have been added' do
    it 'should display a message' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
    end

    it 'should have a link to add a new restaurant' do
      visit '/restaurants'
      expect(page).to have_link 'Add a new restaurant'
      click_link('Add a new restaurant')
      expect(current_path).to eq '/restaurants/new'
    end


  end
end

describe 'creating a restaurant' do
  it 'adds it to the restaurants index' do
    visit '/restaurants'
    fill_in 'Name', with:'Mcdonalds'
    fill_in 'Address', with: 'somewhere'
    fill_in 'Cuisine', with: 'burgers'
    click_button 'Create Restaurant'

    # expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'Mcdonalds'
  end

  it 'with invalid data it shows an error' do
    visit '/restaurants'
    fill_in 'Name', with:''
    fill_in 'Address', with: ''
    fill_in 'Cuisine', with: ''
    click_button 'Create Restaurant'

    expect(page).to have_content 'errors'
  end
end

describe 'editing a restaurant' do
  before  { Restaurant.create(name: 'KFC', address: 'an address', cuisine: 'chicken')}

  it 'saves the change to the restaurant' do
    visit '/restaurants'
    click_link 'Edit KFC'

    fill_in 'Name', with: 'Kentucky Fried Chicken'
    click_button 'Update Restaurant'


    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'Kentucky Fried Chicken'
  end

  it 'with invalid data it shows an error' do
   visit '/restaurants'
  click_link 'Edit KFC'

  fill_in 'Name', with: 'kfc'
  click_button 'Update Restaurant'

  expect(page).to have_content 'error'
  end
end

describe 'deleting a restaurant' do
  before  { Restaurant.create(name: 'KFC', address: 'an address',  cuisine: 'chicken')}

  it 'removes the restaurant from the listing' do
    visit '/restaurants'
    click_link 'Delete KFC'

    expect(page).not_to have_content 'KFC'
    expect(page).to have_content 'Deleted successfully'
  end
end




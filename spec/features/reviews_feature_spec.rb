require 'spec_helper'

describe 'writing reviews' do 
  before  { Restaurant.create(name: 'Nandos', address: 'an address', cuisine: 'chicken')}
  specify 'restaurant begins with no reviews' do
    visit '/restaurants'
    expect(page).to have_content '0 reviews'
  end
  
  it 'adds the review to the restaurant' do
    visit '/restaurants'
    click_link 'Review Nandos'

    fill_in 'Comments', with: 'nice friendly atmosphere'
    select '4', from: 'Rating'
    click_button 'Submit Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'nice friendly atmosphere'
    expect(page).to have_content '1 review'
  end

  
end
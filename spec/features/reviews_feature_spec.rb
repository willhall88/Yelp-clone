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

describe 'averaging the reviews 'do
  it 'shows the average review for the restaurant' do
    restaurant = Restaurant.create(name: 'Nandos', address: 'an address', cuisine: 'chicken')
    restaurant.reviews.create(comments: 'it was average', rating: '3')
    restaurant.reviews.create(comments: 'it was good', rating: '4') 
    visit '/restaurants'

    expect(page).to have_content 'Average Review: 3.5'
    
  end

end

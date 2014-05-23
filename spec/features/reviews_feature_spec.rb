require 'spec_helper'

describe 'writing reviews' do 
  before(:each)  { Restaurant.create(name: 'Nandos', address: 'an address', cuisine: 'chicken')}
    
  specify 'restaurant begins with no reviews' do
    visit '/restaurants'
    expect(page).to have_content '0 reviews'
  end
  
  it 'adds the review to the restaurant', js: true do
    visit '/restaurants'
    fill_in 'Comments', with: 'nice friendly atmosphere'
    select '4', from: 'Rating'
    click_button 'Submit Review'

    expect(page).to have_content 'nice friendly atmosphere'
    expect(page).to have_content '1 review'
  end
end

describe 'averaging the reviews 'do
  before do
    @restaurant = Restaurant.create(name: 'Nandos', address: 'an address', cuisine: 'chicken')
    @restaurant.reviews.create(rating: '3')
    @restaurant.reviews.create(rating: '4') 
  end

  it 'shows the average review for the restaurant' do
    visit '/restaurants'

    expect(page).to have_content 'Average Rating: ★★★★☆'  
  end

  it 'shows the average review to one decimal' do
    @restaurant.reviews.create(rating: '4')
    visit '/restaurants'

    expect(page).to have_content 'Average Rating: ★★★★☆'  
    expect(page).not_to have_content 'Average Rating: 3.666'  
  end

end

describe 'star ratings' do
  before do
    @restaurant = Restaurant.create(name: 'Nandos', address: 'an address', cuisine: 'chicken')
    @restaurant.reviews.create(rating: '4')
    @restaurant.reviews.create(rating: '4')  
  end

  it 'shows the ratings as stars' do
    visit '/restaurants'
    expect(page).to have_content '★★★★☆'    
  end

  it 'shows the average ratings as stars' do
    visit '/restaurants'
    expect(page).to have_content 'Average Rating: ★★★★☆'    
  end
end



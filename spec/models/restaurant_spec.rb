require 'spec_helper'

describe 'restaurant' do 
  it 'should have a name'do
    expect(Restaurant.new(name: nil)).to have(2).errors_on(:name)
  end
  
  it 'should have a name'do
    expect(Restaurant.new(name: 'Pret')).to have(0).errors_on(:name)
  end

  it 'should have an address'do
    expect(Restaurant.new(address: nil)).to have(2).errors_on(:address)
  end
  
  it 'should have an address'do
    expect(Restaurant.new(address: 'somewhere')).to have(0).errors_on(:address)
  end

  it 'should have a cuisine'do
    expect(Restaurant.new(cuisine: nil)).to have(1).errors_on(:cuisine)
  end
  
  it 'should have a cuisine'do
    expect(Restaurant.new(cuisine: 'somewhere')).to have(0).errors_on(:cuisine)
  end

  it'the address should be 3 or more characters long'do
    expect(Restaurant.new(address: 'a')).to have(1).errors_on(:address)
  end

  it'the address should be 3 or more characters long'do
    expect(Restaurant.new(address: 'pret')).to have(0).errors_on(:address)
  end

  it 'is not valid unless the name begins with an uppercase letter' do
    expect(Restaurant.new(name: 'nandos')).to have(1).error_on(:name)
  end

  context "calculating average reviews" do
    let(:restaurant) { Restaurant.create(name: 'KFC', address: 'somewhere', cuisine: 'food')}

    it 'should return N/A when there are no reviews' do
      expect(restaurant.average_rating).to eq('N/A')
    end

    it 'should return the score of one review' do
      restaurant.reviews.create(comments: 'it was average', rating: '3')
      expect(restaurant.average_rating).to eq 3
    end

    it 'should return the score of one review' do
      restaurant.reviews.create(comments: 'it was average', rating: '3')
      expect(restaurant.average_rating).to eq 3
    end

    it 'should return the average score of 2 reviews' do
      restaurant.reviews.create(comments: 'it was average', rating: '3')
      restaurant.reviews.create(comments: 'it was average', rating: '4')
      expect(restaurant.average_rating).to eq 3.5
    end

  end
end

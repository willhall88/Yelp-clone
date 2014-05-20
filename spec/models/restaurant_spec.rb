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
end

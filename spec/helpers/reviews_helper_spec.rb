require 'spec_helper'

describe ReviewsHelper do
  describe '#star ratings' do

    it 'it shows 5 full stars if the rating is 5' do
      expect(star_rating(5)).to eq '★★★★★'
    end

    it 'it shows 5 full stars if the rating is 5' do
      expect(star_rating(3)).to eq '★★★☆☆'
    end


  end

end

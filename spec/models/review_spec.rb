require 'spec_helper'

describe Review do 
  context "validating the rating system" do
 
    it 'should not have a rating more than 5'do
      review = Review.new(comments: 'it was Awesome!', rating:10)

      expect(review).to have(1).error_on(:rating)
    end

    it 'should not have a rating less than 1' do
      review = Review.new(comments: 'it was rubbish!', rating:0)

      expect(review).to have(1).error_on(:rating)
    end

    it 'should not have a rating less than 1' do
      review = Review.new(comments: 'it was average!', rating:3)

      expect(review).to have(0).error_on(:rating)
    end

  end
  
end


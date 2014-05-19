class RestaurantsController < ApplicationController

  def index

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    Restaurant.create({name: 'Mcdonalds', address:'somewhere'})
    redirect_to '/restaurants'
  end

end

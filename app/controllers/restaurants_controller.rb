class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.order('created_at DESC')
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
  end

  def create
  end
end

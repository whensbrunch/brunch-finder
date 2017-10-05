class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.order('created_at DESC')
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        # let's use flash
        format.html { redirect_to root_path, notice: 'Restaurant was successfully added!' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        # ditto
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end

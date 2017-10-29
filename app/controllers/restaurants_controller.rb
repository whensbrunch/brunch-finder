class RestaurantsController < ApplicationController
  def index
    # Get tags for filter list
    @tags = Tag.all

    if params.has_key?(:tag)
      # Filter by restaurants
      @restaurants = Restaurant.joins(
        "JOIN
            taggings ON restaurants.id = taggings.restaurant_id
         WHERE
             taggings.tag_id = #{params[:tag]}"
      )
    else
      # Return all restaurants
      @restaurants = Restaurant.order('created_at DESC')
      @review = current_user.reviews.build if logged_in?
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews.paginate(page: params[:page])
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

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :address)
    end

end

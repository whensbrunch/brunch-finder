class RestaurantsController < ApplicationController
  before_action :force_json, only: [:search, :find]

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
      @filter = true

    elsif params.has_key?(:restaurant)

      # Filter to only that restaurant
      @restaurants = Restaurant.find( params[:restaurant][:id] )
      @filter = true

    elsif params.has_key?(:random)

      # Get a random restaurant
      @restaurants = Restaurant.find(rand(Restaurant.all.length + 1))
      @filter = true

    else

      # Return all restaurants
      @restaurants = Restaurant.order('created_at DESC')
      @filter = false

    end

    @review = current_user.reviews.build if logged_in?

  end

  def all
    @restaurants = Restaurant.paginate(page: params[:page])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = current_user.reviews.build if logged_in?
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

  def search
    @restaurants = Restaurant.where("name LIKE ?", "%#{params[:q]}%").limit(5)
  end

  def find
    @restaurants = Restaurant.where("name LIKE ?", "%#{params[:q]}%").limit(5)
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :address)
    end

    def force_json
      request.format = :json
    end

end

require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  def setup
    @restaurant = Restaurant.new do |r|
      r.name = "Example"
      r.address = "Calle 1"
    end
  end

  test "should be valid" do
    assert @restaurant.valid?
  end

  test "name should be present" do
    @restaurant.name = "          "
    assert_not @restaurant.valid?
  end
  #
  test "email should be present" do
    @restaurant.address = "          "
    assert_not @restaurant.valid?
  end

  test "name should not be too long" do
    @restaurant.name = "a" * 51
    assert_not @restaurant.valid?
  end

  test "email should not be too long" do
    @restaurant.address = "a" * 244 + "@example.com"
    assert_not @restaurant.valid?
  end

end

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = users(:example)
    @restaurant = restaurants(:example)
    @review = @restaurant.reviews.build(
      content: "Lorem ipsum",
      user_id: @user.id,
      rating: 5
    )
  end

  test "should be valid" do
    assert @review.valid?
  end

  test "user id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end

  test "restaurant id should be present" do
    @review.restaurant_id = nil
    assert_not @review.valid?
  end

  test "content should be present" do
    @review.content = "     "
    assert_not @review.valid?
  end

  test "order should be most recent first" do
    assert_equal reviews(:most_recent), Review.first
  end
end

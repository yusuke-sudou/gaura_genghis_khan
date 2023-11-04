require "test_helper"

class Public::ReviewsCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_reviews_comments_create_url
    assert_response :success
  end
end

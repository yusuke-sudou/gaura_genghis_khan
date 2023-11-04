require "test_helper"

class Public::PostBoardCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_post_board_comments_index_url
    assert_response :success
  end
end

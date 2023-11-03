require "test_helper"

class Adimn::PostBoardCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adimn_post_board_comments_index_url
    assert_response :success
  end
end

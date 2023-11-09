require "test_helper"

class Public::PostBoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_post_boards_index_url
    assert_response :success
  end
end

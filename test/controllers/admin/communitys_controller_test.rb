require "test_helper"

class Admin::CommunitysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_communitys_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_communitys_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_communitys_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_communitys_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_communitys_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_communitys_destroy_url
    assert_response :success
  end
end

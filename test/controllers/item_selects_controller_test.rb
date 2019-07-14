require 'test_helper'

class ItemSelectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get item_selects_index_url
    assert_response :success
  end

  test "should get create" do
    get item_selects_create_url
    assert_response :success
  end

  test "should get update" do
    get item_selects_update_url
    assert_response :success
  end

  test "should get destroy" do
    get item_selects_destroy_url
    assert_response :success
  end

end

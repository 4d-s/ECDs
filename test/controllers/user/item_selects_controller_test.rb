require 'test_helper'

class User::ItemSelectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_item_selects_index_url
    assert_response :success
  end

end

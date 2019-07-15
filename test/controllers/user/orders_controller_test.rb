require 'test_helper'

class User::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_orders_new_url
    assert_response :success
  end

  test "should get adress" do
    get user_orders_adress_url
    assert_response :success
  end

  test "should get index" do
    get user_orders_index_url
    assert_response :success
  end

end

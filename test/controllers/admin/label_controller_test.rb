require 'test_helper'

class Admin::LabelControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_label_new_url
    assert_response :success
  end

end

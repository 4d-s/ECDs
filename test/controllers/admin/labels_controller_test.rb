require 'test_helper'

class Admin::LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_labels_new_url
    assert_response :success
  end

end

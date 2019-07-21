require 'test_helper'

class Admin::GenreControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_genre_new_url
    assert_response :success
  end

end

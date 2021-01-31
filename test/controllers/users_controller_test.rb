require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get count" do
    get users_count_url
    assert_response :success
  end
end

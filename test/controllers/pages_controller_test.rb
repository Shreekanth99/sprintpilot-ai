require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "guest user should be redirected to sign in" do
    get root_url

    assert_response :redirect
    assert_redirected_to new_user_session_url
  end
end

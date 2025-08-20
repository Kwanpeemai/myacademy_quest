require "test_helper"

class BragControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brag_url
    assert_response :success
  end
end

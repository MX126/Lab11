require "test_helper"

class PalmsControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get palms_input_url
    assert_response :success
  end

  test "should get view" do
    get palms_view_url
    assert_response :success
  end
end

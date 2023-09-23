require "test_helper"

class EntryPointControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get entry_point_index_url
    assert_response :success
  end
end

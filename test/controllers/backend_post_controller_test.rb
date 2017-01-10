require 'test_helper'

class BackendPostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backend_post_index_url
    assert_response :success
  end

end

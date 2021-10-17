require "test_helper"

class SlideshowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get slideshows_index_url
    assert_response :success
  end
end

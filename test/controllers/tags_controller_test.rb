require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tags_show_url
    assert_response :success
  end

end

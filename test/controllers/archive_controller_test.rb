require 'test_helper'

class ArchiveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get archive_index_url
    assert_response :success
  end

end

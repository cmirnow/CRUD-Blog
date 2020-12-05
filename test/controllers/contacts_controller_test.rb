require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contacts_index_url
    assert_response :success
  end

end

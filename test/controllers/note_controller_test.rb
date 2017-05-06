require 'test_helper'

class NoteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get note_index_url
    assert_response :success
  end

  test "should get show" do
    get note_show_url
    assert_response :success
  end

end

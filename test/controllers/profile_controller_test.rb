require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get place" do
    get :place
    assert_response :success
  end

  test "should get bio" do
    get :bio
    assert_response :success
  end

end

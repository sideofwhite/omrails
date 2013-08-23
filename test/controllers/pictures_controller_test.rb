require 'test_helper'

class PicturesControllerTest < ActionController::TestCase
  setup do
    @picture = pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create picture" do
    assert_difference('Picture.count') do
      post :create, picture: { description: @picture.description, image_content_type: @picture.image_content_type, image_file_name: @picture.image_file_name, image_file_size: @picture.image_file_size, image_remote_url: @picture.image_remote_url, post_id: @picture.post_id, user_id: @picture.user_id }
    end

    assert_redirected_to picture_path(assigns(:picture))
  end

  test "should show picture" do
    get :show, id: @picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @picture
    assert_response :success
  end

  test "should update picture" do
    patch :update, id: @picture, picture: { description: @picture.description, image_content_type: @picture.image_content_type, image_file_name: @picture.image_file_name, image_file_size: @picture.image_file_size, image_remote_url: @picture.image_remote_url, post_id: @picture.post_id, user_id: @picture.user_id }
    assert_redirected_to picture_path(assigns(:picture))
  end

  test "should destroy picture" do
    assert_difference('Picture.count', -1) do
      delete :destroy, id: @picture
    end

    assert_redirected_to pictures_path
  end
end

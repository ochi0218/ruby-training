require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    ochi = users(:one)
    post :create, name: ochi.name, password: 'secret'
    assert_redirected_to admin_url
    assert_equal ochi.id, session[:user_id]
  end

  test "should get destroy" do
    get :destroy
    assert_redirected_to store_url
  end

end

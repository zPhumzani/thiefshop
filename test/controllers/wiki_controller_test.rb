require 'test_helper'

class WikiControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get article" do
    get :article
    assert_response :success
  end

  test "should get search_results" do
    get :search_results
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

end
